class UserAffinity

  def initialize user, users_exclude = {}
    @user = user
    @users = User.all
    @filters = option_filters
  end

  def check_filter_relation_b_t_m( hash )
    users  = User.joins(hash).where("#{hash}.id" => @user.send(hash) ).find_all_by_id(@users)
    @users = users if users.first
  end

  def check_filter_relation (hash)
    # type = (type == :relacion_b_t_m)? "#{hash}.id" : "#{hash}_id"
    users  = User.joins(hash).where("#{hash}_id" => @user.send(hash) ).find_all_by_id(@users)
    @users = users if users.first
  end

  def check_filter_attribute attribute
   users  = User.where( attribute => @user[attribute])
   @users = users if users.first
  end

  def users_affinities
    @filters.each do |x|
      # puts "---" * 50
      check_filter_attribute( x[:hash] ) if x[:type] == :attribute
      check_filter_relation( x[:hash] ) if x[:type] == :relacion
      check_filter_relation_b_t_m( x[:hash] ) if x[:type] == :relacion_b_t_m
      # puts @users.each{|x| puts x.interests.inspect}
      # puts "***" * 50
    end
    @users
  end

  def option_filters
   [
        {:hash => :country_id, :type => :attribute }
        # {:hash => :state, :type => :attribute },
        # {:hash => :programs, :type => :relacion_b_t_m },
        # {:hash => :interests, :type => :relacion_b_t_m }
        # {:hash => :before_industry, :type => :relacion },
        # {:hash => :before_function, :type => :relacion },
        # {:hash => :after_industry, :type => :relacion },
        # {:hash => :after_function, :type => :relacion }
      ]

  end

end