class Industry < ActiveRecord::Base
  has_many :before_industries
  has_many :after_industries
  has_many :users, through: :before_industries
  has_many :users, through: :after_industries
end
