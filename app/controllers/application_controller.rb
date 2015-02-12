class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?  

  protected

  #allows us to add extra attributes to the sign up process such as name

  def configure_devise_permitted_parameters
    
    registration_params = [:first_name, :last_name, :email, :password, :password_confirmation, :type, :company_name, :subscription, :avatar, :company_website, :facebook, :twitter, :instagram, :google, :pinterest]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

end
