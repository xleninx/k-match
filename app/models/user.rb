class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :connection,->{where "status = \"established\""}, :class_name => "Connection", :foreign_key => "prospective_id"
  has_many :connections_rejected,->{where "status = \"rejected\""}, :class_name => "Connection", :foreign_key => "current_id"
  has_many :request_connections,->{where "status = \"pending\""}, :class_name => "Connection", :foreign_key => "current_id"

  
  belongs_to :current_industry, :class_name => 'Industry'
  belongs_to :interest_industry, :class_name => 'Industry'
  belongs_to :current_function, :class_name => 'Function'
  belongs_to :interest_function, :class_name => 'Function'
  belongs_to :country
  has_and_belongs_to_many :programs
  has_and_belongs_to_many :clubs

  validates :email, uniqueness: true
  validates :programs, presence: true, :on => :update
  validates :current_industry, presence: true, :on => :update
  validates :current_function, presence: true, :on => :update
  validates :country, presence: true, :on => :update
  validates :state, presence: true, :on => :update, if: :us_country?

  ROLES = ["Prospective","Current","Leader","Admin"]

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

