class UserConnectionManager

  def initialize (user,message = '')
    @user = user
    @message = message
  end

  def cancel_request
    @user.request_connections.first.delete unless @user.request_connections.empty?
  end

  def connection_rejected 
    connections_status(:rejected)
  end

  def connection_accept
    connections_status(:established)
  end

  def send_request
    if make_request?
      make_connection
    else
      remake_connection unless in_valid_time?
    end
  end


  private

  def make_connection
    user_to_assig = validate_connection UserAffinity.new(@user).users_with_affinities
    create_connection(user_to_assig, @message)
  end

  def create_connection(user_to_assig, message)
    connection = Connection.new
    connection.current_user = @user
    connection.prospective_user = user_to_assig.first
    connection.message = message
    connection.status = "pending"
    connection.save 
  end

  def remake_connection
    connection_rejected
    make_connection
  end

  def validate_connection( user_with_affinity )
    if(valid_numbers_connection? && user_with_affinity.empty?)
      get_lider_lower_connection
    else
      user_with_affinity
    end
  end

  def connections_status(status)
    unless @user.request_connections.empty?
      @user.request_connections.first.update_attributes(:status => status)
    end
  end

  def get_liders
    User.joins(:request_connections).where("user_rights" => Role::LEADER ).group("prospective_id").count
  end
  
  def get_lider_lower_connection
    id_lider = get_liders.sort_by {|_key, value| value}.first
    User.find(id_lider)
  end

  def make_request?
    (request_empty? && valid_numbers_connection?)
  end

  def in_valid_time?
    (request_empty? && (@user.request_connections.first.create_at > 2.day.ago))
  end

  def request_empty?
    @user.request_connections.empty?
  end

  def valid_numbers_connection?
    (@user.connections_rejected.count < 2)
  end

end