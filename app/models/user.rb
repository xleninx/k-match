class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  before_create do
#    if self.email.include? "@kellogg.northwestern.edu"
#      self.user_rights = 1
#    else
#      self.user_rights = 0
#    end
#  end

  has_and_belongs_to_many :programs
  belongs_to :country

  belongs_to :before_industry, :class_name => 'Industry'
  belongs_to :after_industry, :class_name => 'Industry'
   
  belongs_to :before_function, :class_name => 'Function'
  belongs_to :after_function, :class_name => 'Function'

  has_and_belongs_to_many :interests

  has_many :connector, :class_name => "Connection", :foreign_key => "prospective_id"
  has_many :connectee, :class_name => "Connection", :foreign_key => "student_id"

  validates :email, uniqueness: true
  validates :programs, presence: true, :on => :update
  validates :before_industry, presence: true, :on => :update
  validates :before_function, presence: true, :on => :update
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
    ROLES[user_rights] << " Student"
  end

  def admin?
    user_rights == 3
  end

  def profile_btn

  end
end

