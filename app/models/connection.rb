class Connection < ActiveRecord::Base
  belongs_to :current_user,  :class_name => "User", :foreign_key => "user_id"
  belongs_to :prospetive_user,  :class_name => "User", :foreign_key => "user_id"
end
