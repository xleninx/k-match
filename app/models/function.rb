class Function < ActiveRecord::Base
  has_many :before_functions , :class_name => "User", :foreign_key => "before_function_id"
  has_many :after_functions, :class_name => "User", :foreign_key => "after_function_id"
end
