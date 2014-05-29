class UserAffinity

  def initialize(user, users_exclude = {})
    @user = user
  end

  def users_with_affinities
    @users = without_excluding_users(nil)
    option_filters.each do |filter,type_filter|
      case type_filter
        when :attribute
          check_filter_attribute( filter )
        when :relation
          check_filter_relation_bt( filter )
        when :relation_b_t_m
          check_filter_relation_btm( filter )
        end
    end
    unless @users.empty?
      User.sort_by_connections(@users)
    else
      nil
    end 
    
  end

  private

  def option_filters
    { programs: :relation_b_t_m,
      country: :relation,
      current_industry: :relation,
      current_function: :relation,
      interest_industry: :relation,
      interest_function: :relation,
      clubs: :relation_b_t_m,
      state: :attribute
    }
  end

  def without_excluding_users ( users_exclude )
    with_excluding_users(User.currents.to_a)
  end

  def validate_filter_result ( filtered_users )
    @users = filtered_users unless filtered_users.empty?
  end

  def users_low_connector
    User.current_lower_connection
  end

  def check_filter_relation ( relation, field )
    filtered_users  = User.joins(relation).where(field => @user.send(relation), "users.id" => @users).group("users.id").all
    validate_filter_result filtered_users
  end

  def check_filter_relation_bt( relation )
    check_filter_relation(relation,"#{relation}_id")
  end

  def check_filter_relation_btm( relation )
    check_filter_relation(relation,"#{relation}.id")
  end

  def check_filter_attribute( attribute )
    filtered_users  = User.where( attribute => @user[attribute], :id => @users).group(:id).all
    validate_filter_result filtered_users
  end

  def with_excluding_users ( users )
    excluded_users = Array.new
    Connection.where("prospective_id = ? and status != ?", @user, "pending").each{|connections| excluded_users << connections.current_user}
    filtered_users = users - excluded_users
  end
end