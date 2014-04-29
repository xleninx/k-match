class Industry < ActiveRecord::Base
  has_many :before_industries, :class_name => "User",:foreign_key => "before_industry_id"
  has_many :after_industries, :class_name => "User",:foreign_key => "after_industry_id"
end
