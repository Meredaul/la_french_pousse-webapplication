class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :town, :latitude, :longitude,:password, :photo, :photo_cache, :remove_photo, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :town, :latitude, :longitude, :password, :photo, :photo_cache, :remove_photo, :remember_me])
  end

end
