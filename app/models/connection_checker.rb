class ConnectionChecker
  def check_connections
    Connection.pending.request_connection.each { |connection| check_connection(connection)  }
  end

  private
  def check_connection(connection)
    prospective = connection.prospective_user
    if (prospective && connection.created_at < 2.day.ago)
      renew_connection connection
    end
  end

  def renew_connection(connection)
    user = connection.prospective_user
    UserConnectionManager.new(user,connection.message).connection_rejected
  end

end