class Connection < ActiveRecord::Base
  belongs_to :current_user,  :class_name => "User", :foreign_key => "current_id"
  belongs_to :prospective_user,  :class_name => "User", :foreign_key => "prospective_id"

  validates_presence_of :current_user,:prospective_user,:status,:message

  def self.connections_by_user_id(id)
    # Connection.joins("INNER JOIN users ON connections.current_id = users.id").
    # current_user.
    where("current_id"=> id ).first
  end

end