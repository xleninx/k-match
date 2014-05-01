class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :connection,->{where "status = 'established'"}, :class_name => "Connection",
   :foreign_key => "prospective_id"
  has_many :connections_rejected,->{where "connections.status = 'rejected'"}, :class_name => "Connection",
  :foreign_key => "current_id"
  has_many :request_connections,->{where "connections.status = 'pending'"}, :class_name => "Connection",
   :foreign_key => "current_id"

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

  def self.request_connections
    User.joins("INNER JOIN connections ON connections.current_id = users.id")
  end

  def self.request_connection id
    request_connections.where(:id => id).first.request_connections.first
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

