class UserConnectionManager

  def inicialize (user,message)
    @user = user
  end

  def make_connection 
    
  end

  def check_conections
    if @user.request_connection.empty?
      user_with_affinity = UserAffinity.new(@user).first
      user_to_assig (user_with_affinity)? user_with_affinity : get_lider_lower_connection
    else
      unless in_valid_time?
        Connection.new(user_with_affinity, message ).save
      else

      end
    end
  end

  private
  def in_valid_time?
    (@user.request_connections.create_at < 2.day.ago)
  end
  
  def get_lider_lower_connection
    Connection.select("*,current_id").group("current_id").count.sort_by {|_key, value| value}.first
  end      
    @user.request_connection

end