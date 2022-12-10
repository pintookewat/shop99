class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit([ :image, :image_cache, :full_name, :phone, :gender, :proffesion, :email, :password, :password_confirmation, :current_password, :age, :location])
    end
    devise_parameter_sanitizer.permit(:edit) do |user_params|
    user_params.permit([ :image, :image_cache, :full_name, :phone, :gender, :proffesion, :email, :password, :password_confirmation, :current_password, :age, :location])
    end
  end
  


  def after_sign_in_path_for(resource)
    user_user_index_path 
  end
end
