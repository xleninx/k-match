class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_states, only: [:edit, :update]
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
  end

  def update

    @user = User.find_by(id: params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.user_rights = params[:right].to_i
    @user.country_id = params[:country_id].to_i
    @user.state = params[:state]
    @user.program_ids = params[:user][:program_ids].reject{|id| id == ""}
    if params[:right].to_i == 1
      @user.grad_year = params[:email].split('@')[0].reverse[0..3].reverse.to_i
    end

    @user.before_industry_id = params[:before_industry_id].to_i
    @user.after_industry_id = params[:after_industry_id].to_i

    @user.before_function_id = params[:before_function_id].to_i
    @user.after_function_id = params[:after_function_id].to_i

    @user.interest_ids = params[:interest_ids]

    if @user.save
      redirect_to profile_path, notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy

    redirect_to users_url, notice: "User deleted."
  end

  def set_states
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

  def profile
   redirect_to edit_user_path(current_user) unless current_user.first_name
  end
end
