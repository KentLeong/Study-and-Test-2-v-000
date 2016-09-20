class ApplicationController < ActionController::Base
  SYN_PARSE = "%~#"
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def home
    @categories = Category.all
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :provider, :uid]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
