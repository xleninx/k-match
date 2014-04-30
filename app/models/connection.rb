class Connection < ActiveRecord::Base
  belongs_to :current_user,  :class_name => "User", :foreign_key => "current_id"
  belongs_to :prospective_user,  :class_name => "User", :foreign_key => "prospective_id"

  validates_presence_of :current_user,:prospective_user,:status,:message
end