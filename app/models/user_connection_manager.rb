class UserConnectionManager

  def initialize (user,message = '')
    @user = user
    @message = message
  end

  def cancel_request
    @user.request_pending_propective.first.delete unless @user.request_pending_propective.empty?
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

  def connection_processed?
    unless @user.request_connections.empty?
      @user.request_connections.first.connection_processed?
    else
      true
    end
  end


  private

  def make_connection
    user_to_assig = user_avalaible_to_asig
    create_connection(user_to_assig, @message)
  end

  def create_connection(user_to_assig, message)
    connection = Connection.new
    connection.current_user = user_to_assig
    connection.prospective_user = @user
    connection.message = message
    connection.status = "pending"
    if connection.save
      connection
    else
      nil
    end
  end

  def remake_connection
    connection_rejected
    make_connection
  end

  def user_avalaible_to_asig
    user_with_affinity = UserAffinity.new(@user).users_with_affinities
    if(valid_numbers_connection? && !user_with_affinity)
      leader_lower_connection
    else
      user_with_affinity
    end
  end

  def connections_status(status)
    unless @user.request_connections.empty?
      @user.request_connections.first.update_attributes(:status => status)
    end
  end
  
  def leader_lower_connection
    User.leader_available
  end

  def make_request?
    (request_empty? && valid_numbers_connection?)
  end

  def in_valid_time?
    (!request_empty? && (@user.request_pending_propective.first.created_at > 2.day.ago))
  end

  def request_empty?
    @user.request_pending_propective.empty?
  end

  def valid_numbers_connection?
    (@user.connections_rejected.count < 2)
  end

end