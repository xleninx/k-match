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

  def self.avg_connection
    data = {}
    str_time = Connection.connection.execute("select avg(update_request) as average from( select (updated_at - created_at) as update_request  from connections where status in('established', 'rejected' )) as x ").first["average"] 
    time = '00:00:00' unless str_time
    data[:days]  = str_time.split(':')[0].to_i / 24
    data[:hours] = str_time.split(':')[0].to_i % 24
    data[:minutes] = str_time.split(':')[1]
    data
  end

end