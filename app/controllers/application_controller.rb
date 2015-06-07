class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # Custom strong params for Devise forms
  DEVISE_PERMITTED_PARAMETERS = {
    sign_up: [
      :name,
      :full_name,
      :email,
      :password,
      :password_confirmation
    ],
    sign_in: [
      :name,
      :email,
      :password,
      :remember_me
    ],
    account_update: [
      :name,
      :full_name,
      :email,
      :password,
      :password_confirmation,
      :current_password
    ]
  }



  def configure_permitted_parameters
    DEVISE_PERMITTED_PARAMETERS.each do |what_for, param_names|
      devise_parameter_sanitizer.for(what_for) { |u| u.permit(param_names) }
    end
  end

  
end
