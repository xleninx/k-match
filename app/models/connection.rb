class Connection < ActiveRecord::Base
  belongs_to :current,  :class_name => "User", :foreign_key => "student_id"
  belongs_to :prospect,  :class_name => "User", :foreign_key => "prospective_id"
end
