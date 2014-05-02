class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_states, only: [:edit, :update]
  before_action :load_user, only: [:profile, :make_connection, :check_connection,
                                   :cancel_request,:search]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
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
    @user.country_id = params[:country_id].to_i
    @user.state = params[:state]
    @user.program_ids = params[:user][:program_ids].reject{|id| id == ""}

    @user.current_industry_id = params[:current_industry_id].to_i
    @user.interest_industry_id = params[:interest_industry_id].to_i
    @user.current_function_id = params[:current_function_id].to_i
    @user.interest_function_id = params[:interest_function_id].to_i
    @user.club_ids = params[:club_ids]

    unless @user.user_rights?
      @user.email.include?("@kellogg.northwestern.edu") ? @user.user_rights = Role::CURRENT : @user.user_rights = Role::PROSPECTIVE
    end

    if params[:right].to_i == Role::CURRENT
      @user.grad_year = params[:email].split('@')[0].reverse[0..3].reverse.to_i
    end

    if @user.save
      send_welcome_mail
      redirect_to profile_user_path(current_user), notice: "User updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_url, notice: "User deleted."
  end


  def profile
   redirect_to edit_user_path(current_user) unless current_user.first_name 
   @user = User.find(params[:id])
  end

  def make_connection
    UserConnectionManager.new(@user,params[:message]).send_request
    UserMailer.connection_request(@user, current_user).deliver
    redirect_to profile_user_path(current_user), notice: "Connection initiated successfully."
  end

  def cancel_request
    UserConnectionManager.new(@user).cancel_request
    redirect_to profile_user_path(current_user), notice: "Connection has been canceled"
  end

  def response_connection
    @user = User.find(params[:id])
    if (params[:operation] == "rejected")
      UserConnectionManager.new(@user).connection_rejected
    else
      UserConnectionManager.new(@user).connection_accept
    end
    @message = Connection.connections_by_user_id(params[:id]).message
  end

  def check_connection
    @request_connections = User.request_connections
  end

  def search
    @user = User.where("first_name || last_name ilike ? and user_rights <> 0", "%#{params[:search]}%")
  end

  def update_role
   User.find(params[:user_id]).update_attribute(:user_rights, params[:user_role])
   redirect_to search_user_path
  end

  def notification_to_prospect_student
    UserMailer.notification_prospective(current_user, User.find(params[:id])).deliver
    redirect_to profile_user_path(current_user), notice: "Sending the notification was successful"
  end

  private
  def load_user
    @user = User.find(current_user.id)
  end

  def send_welcome_mail
    if !current_user.contact_count and current_user.user_rights == Role::PROSPECTIVE
      HomeMailer.registration_confirmation(current_user).deliver
      current_user.update_attribute(:contact_count, 0)
    end
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
end