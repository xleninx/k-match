class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :connections, :class_name => "Connection",:foreign_key => "current_id"
  has_many :request_connections, :class_name => "Connection", :foreign_key => "prospective_id"

  has_many :connections_rejected,->{where "connections.status = 'rejected'"}, :class_name => "Connection",
  :foreign_key => "current_id"
  has_many :request_rejected,->{where "connections.status = 'rejected' "}, :class_name => "Connection",
  :foreign_key => "prospective_id"
  has_many :request_pending_propective,->{where "connections.status = 'pending' "}, :class_name => "Connection",
  :foreign_key => "prospective_id"
  has_many :request_pending_current,->{where "connections.status = 'pending' "}, :class_name => "Connection",
  :foreign_key => "current_id"

  belongs_to :current_industry, :class_name => 'Industry'
  belongs_to :interest_industry, :class_name => 'Industry'
  belongs_to :current_function, :class_name => 'Function'
  belongs_to :interest_function, :class_name => 'Function'
  belongs_to :country
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :clubs

  scope :admins, lambda{where(:user_rights => Role::ADMIN)}
  scope :leaders, lambda{where(:user_rights => Role::LEADER)}
  scope :currents, lambda{where(:user_rights => Role::CURRENT)}
  scope :students, lambda{where(:user_rights => Role::CURRENT)}
  scope :prospectives, lambda{where(:user_rights => Role::PROSPECTIVE)}

  scope :with_connections, lambda{joins("LEFT JOIN connections ON connections.current_id = users.id")}
  scope :without_connections , lambda { with_connections.where("connections.current_id" => nil) }
  scope :connections_not_nil, lambda{where.not("connections.current_id" => nil)}

  validates_presence_of :first_name, :last_name,:programs,
                        :current_industry,:current_function,
                        :interest_industry,:interest_function,
                        :clubs,:country, :on => :update
  validates :email, uniqueness: true
  validates :state, presence: true, :on => :update, if: :us_country?

  ROLES = ["Prospective","Current","Leader","Admin"]

  def self.leader_available
   unless leaders.without_connections.empty?
      leaders.without_connections.first
    else
      leader_lower_connection
    end
  end

  def self.leader_lower_connection
    id_lider = leaders.with_connections.group("users.id").count.sort_by{|_key, x| x}.first.first
    find(id_lider)
  end

  def self.sort_by_connections(ids)
    users = where(:id => ids)
    id_current = users.with_connections.group("current_id").count.sort_by {|_key, value| value}.first.first
    unless id_current
      currents.without_connections.first
    else
      find(id_current)
    end

  end
  def self.request_connection(id)
    request_connections.where(:id => id).first
  end

  def full_name
    return "#{first_name} #{last_name}".titleize
  end

  def us_country?
    country_id == 234
  end

  def rigths_string
    r = (user_rights == nil) ? Role::PROSPECTIVE : user_rights
    ROLES[r] + " Student"
  end

  def admin?
    user_rights == Role::ADMIN
  end

  def current?
    user_rights == Role::CURRENT
  end

  def prospective?
    user_rights == Role::PROSPECTIVE
  end

  def leader?
    user_rights == Role::LEADER
  end

  def generate_token_cancel_account
    self.cancel_account_token = Digest::MD5.hexdigest(email)
    self.save
    self.cancel_account_token
  end

  def self.request_connections
    joins("INNER JOIN connections ON connections.prospective_id = users.id")
  end

  def self.request_connections_pending
    request_connections.where("connections.status = 'pending' ")
  end

  def valid_cancel_account?(token,password)
    (valid_password?(password) && token == cancel_account_token)
  end

end