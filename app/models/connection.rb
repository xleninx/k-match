class Connection < ActiveRecord::Base
  belongs_to :current_user,  :class_name => "User", :foreign_key => "current_id"
  belongs_to :prospective_user,  :class_name => "User", :foreign_key => "prospective_id"

  validates_presence_of :current_user,:prospective_user,:status,:message
  scope :request_connection, lambda{joins("LEFT JOIN users ON connections.prospective_id = users.id")}
  scope :pending, lambda{where("connections.status" => "pending")}

  def self.connections_by_user_id(id)
    where("prospective_id"=> id).first
  end

  def connection_processed?
    !has_status?(:pending)
  end

  def has_status?(in_status)
    status == in_status.to_s
  end

end