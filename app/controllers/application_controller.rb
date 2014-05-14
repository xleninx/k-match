class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << [:email, :first_name, :last_name]
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : profile_user_path(current_user)
  end
 
  def authenticate_active_admin_user!
      authenticate_user!
      unless false
          flash[:alert] = 'You are not authorized to access this resource!'
          redirect_to root_path
      end
  end

  def access_denied_admin(resource)
    flash[:alert] = 'You are not authorized to access this resource!'
    redirect_to root_path
  end

end

