class UserAffinity

  def initialize(user, users_exclude = {})
    @user = user
    @users = without_excluding_users( users_exclude )
  end

  def users_with_affinities
    option_filters.each do |filter,type_filter|
      puts @users
      case type_filter
        when :attribute
          check_filter_attribute( filter )
        when :relation
          check_filter_relation_bt( filter )
        when :relation_b_t_m
          check_filter_relation_btm( filter )
        end
    end
    # @users
    puts " *** " * 50
    puts @users.inspect
    # .find(:all, :select => '*, count(*) AS count, users.id', :group => 'users.id', :order => 'count')
    users_low_connector
  end


  private

  def option_filters
    { country: :relation,
      state: :attribute,
      programs: :relation_b_t_m,
      interests: :relation_b_t_m,
      before_industry: :relation,
      before_function: :relation,
      after_industry: :relation,
      after_function: :relation
    }
  end

  def without_excluding_users ( users_exclude )
    User.where.not(:id => @user.id).all
  end

  def validate_filter_result ( filtered_users )
    @users = filtered_users unless filtered_users.empty?
  end

  def users_low_connector
    User.find(:all, :select => '*, count(*) AS count, users.id', :conditions => ["users.id IN (?)", @users], :group => 'users.id', :order => 'count DESC')
  end

  def check_filter_relation ( relation, field )
    filtered_users  = User.joins(relation).where(field => @user.send(relation), :id => @users).group(:id).all
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
end