class Industry < ActiveRecord::Base
  has_many :users_current, :class_name => "User",:foreign_key => "current_industry_id"
  has_many :users_with_interest, :class_name => "User",:foreign_key => "interest_industry_id"
end
