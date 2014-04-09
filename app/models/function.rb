class Function < ActiveRecord::Base
  has_many :before_functions
  has_many :after_functions
  has_many :users, through: :before_functions
  has_many :users, through: :after_functions
end
