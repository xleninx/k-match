class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :admins, lambda{where(:user_rights => 3)}
  scope :leaders, lambda{where(:user_rights => 2)}
  scope :currents, lambda{where(:user_rights => 1)}
  scope :prospectives, lambda{where(:user_rights => 0)}

  scope :with_connections, lambda{joins("LEFT JOIN connections ON connections.current_id = users.id").connections_not_nil}
  scope :connections_not_nil, lambda{where.not("connections.current_id" => nil)}

  has_many :connection, :class_name => "Connection",:foreign_key => "prospective_id"
  # has_many :connections_rejected, :class_name => "Connection",:foreign_key => "current_id"
  has_many :request_connections, :class_name => "Connection", :foreign_key => "current_id"



  # has_many :connection,->{where "status = \"established\""}, :class_name => "Connection",
  #  :foreign_key => "prospective_id"
  has_many :connections_rejected,->{where "status = \"rejected\""}, :class_name => "Connection",
  :foreign_key => "current_id"
  # has_many :request_connections,->{where "status = \"pending\""}, :class_name => "Connection",
  #  :foreign_key => "current_id"


  #User.joins(relation).where(field => @user.send(relation), :id => @users).group(:id).all
  #User.joins("INNER JOIN connections ON connections.current_id = users.id").where("current_id" => id) }

  belongs_to :current_industry, :class_name => 'Industry'
  belongs_to :interest_industry, :class_name => 'Industry'
  belongs_to :current_function, :class_name => 'Function'
  belongs_to :interest_function, :class_name => 'Function'
  belongs_to :country
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :clubs

  validates_presence_of :first_name, :last_name,:programs,
                        :current_industry,:current_function,
                        :programs,:country, :on => :update
  validates :email, uniqueness: true
  validates :state, presence: true, :on => :update, if: :us_country?

  ROLES = ["Prospective","Current","Leader","Admin"]

  def self.leaders_available
    if leaders.with_connections.empty?
      leaders
    else
      leader_lower_connection
    end
  end

  def self.leader_lower_connection
    id_lider = leaders.with_connections.group("prospective_id").count.sort_by {|_key, value| value}.first.first
    find(id_lider)
  end

  def self.current_available
    if currents.with_connections.empty?
      currents
    else
      current_lower_connection
    end
  end

  def self.current_lower_connection
    id_current = currents.with_connections.group("prospective_id").count.sort_by {|_key, value| value}.first.first
    find(id_current)
  end

  # def self.request_connections
  #   joins("INNER JOIN connections ON connections.current_id = users.id")
  # end

  def self.request_connection(id)
    request_connections.where(:id => id).first
    # .request_connections.first
  end

  def full_name
    return "#{first_name} #{last_name}".titleize
  end

  def us_country?
    country_id == 234
  end

  def rigths_string
    r = (user_rights == nil) ? 0 : user_rights
    ROLES[r] + " Student"
  end

  def admin?
    user_rights == 3
  end

  def profile_btn

  end
end

