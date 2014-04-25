class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :programs
  belongs_to :program
  belongs_to :country

  has_many :preferences
  has_many :interests, through: :preferences

  has_one :before_industry
  has_one :industry, through: :before_industry

  has_one :after_industry
  has_one :industry, through: :after_industry

  has_one :before_function
  has_one :function, through: :before_function

  has_one :after_function
  has_one :function, through: :after_function

  has_many :connector, :class_name => "Connection", :foreign_key => "prospective_id"
  has_many :connectee, :class_name => "Connection", :foreign_key => "student_id"

  validates :email, uniqueness: true

  def full_name
    return "#{first_name} #{last_name}".titleize
  end
end

