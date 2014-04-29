class Function < ActiveRecord::Base
  has_many :users_current , :class_name => "User", :foreign_key => "current_function_id"
  has_many :users_with_insterest, :class_name => "User", :foreign_key => "interest_function_id"
end
