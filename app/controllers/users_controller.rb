class UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @connection = Connection.new
    @connection.prospective_id = current_user.id
    #location
    @student = User.where("country_id = ? AND user_rights = ?", current_user.country_id, 1)
    #program
    if @student.count > 0
      @student = User.where("country_id = ? AND user_rights = ? AND program_id = ?", current_user.country_id, 1, current_user.program_id)
      unless @student.count > 0
        @student = User.where("country_id = ? AND user_rights = ?", current_user.country_id, 1)
      end
    else
      @student = User.where("user_rights = ? AND program_id", 1, current_user.program_id)
    end
    #industry

    #function

    #industry interest

    #function interest

    #club interest

    @connection.student_id = @student.first.id
    if @connection.save
      UserMailer.connection_request(@student.first, current_user).deliver
      redirect_to users_url, notice: "Connection initiated successfully."
    else
      render 'index'
    end
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.user_rights = params[:right]
    @user.country_id = params[:country_id]
    @user.program_id = params[:program_id]
    @user.class = params[:class]
    @user.contact_count = params[:contact_count]

    if @user.save
      redirect_to users_url, notice: "User created successfully."
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
    @states = [["AL", "Alabama"],
["AK", "Alaska"],
["AZ", "Arizona"],
["AR", "Arkansas"],
["CA", "California"],
["CO", "Colorado"],
["CT", "Connecticut"],
["DE", "Delaware"],
["DC", "District of Columbia"],
["FL", "Florida"],
["GA", "Georgia"],
["HI", "Hawaii"],
["ID", "Idaho"],
["IL", "Illinois"],
["IN", "Indiana"],
["IA", "Iowa"],
["KS", "Kansas"],
["KY", "Kentucky"],
["LA", "Louisiana"],
["ME", "Maine"],
["MD", "Maryland"],
["MA", "Massachusetts"],
["MI", "Michigan"],
["MN", "Minnesota"],
["MS", "Mississippi"],
["MO", "Missouri"],
["MT", "Montana"],
["NE", "Nebraska"],
["NV", "Nevada"],
["NH", "New Hampshire"],
["NJ", "New Jersey"],
["NM", "New Mexico"],
["NY", "New York"],
["NC", "North Carolina"],
["ND", "North Dakota"],
["OH", "Ohio"],
["OK", "Oklahoma"],
["OR", "Oregon"],
["PA", "Pennsylvania"],
["RI", "Rhode Island"],
["SC", "South Carolina"],
["SD", "South Dakota"],
["TN", "Tennessee"],
["TX", "Texas"],
["UT", "Utah"],
["VT", "Vermont"],
["VA", "Virginia"],
["WA", "Washington"],
["WV", "West Virginia"],
["WI", "Wisconsin"],
["WY", "Wyoming"]]
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.user_rights = params[:right].to_i
    @user.country_id = params[:country_id].to_i
    @user.state = params[:state]
    @user.program_id = params[:program_id].to_i
    if params[:right].to_i == 1
      @user.grad_year = params[:email].split('@')[0].reverse[0..3].reverse.to_i
    end

    bf_ind = BeforeIndustry.new
    bf_ind.user_id = current_user.id
    bf_ind.industry_id = params[:before_industry_id].to_i
    if bf_ind.save
    else
      render 'edit'
    end

    af_ind = AfterIndustry.new
    af_ind.user_id = current_user.id
    af_ind.industry_id = params[:after_industry_id].to_i
    if af_ind.save
    else
      render 'edit'
    end

    bf_fnc = BeforeFunction.new
    bf_fnc.user_id = current_user.id
    bf_fnc.function_id = params[:before_function_id].to_i
    if bf_fnc.save
    else
      render 'edit'
    end

    af_fnc = AfterFunction.new
    af_fnc.user_id = current_user.id
    af_fnc.function_id = params[:after_function_id].to_i
    if af_fnc.save
    else
      render 'edit'
    end

    int1 = Preference.new
    int1.user_id = current_user.id
    int1.interest_id = params[:interest1_id].to_i
    if int1.save
    else
      render 'edit'
    end

    int2 = Preference.new
    int2.user_id = current_user.id
    int2.interest_id = params[:interest2_id].to_i
    if int2.save
    else
      render 'edit'
    end

    int3 = Preference.new
    int3.user_id = current_user.id
    int3.interest_id = params[:interest3_id].to_i
    if int3.save
    else
      render 'edit'
    end

    if @user.save
      redirect_to homes_url, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end
end
