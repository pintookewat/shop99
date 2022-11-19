class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :phone, :gender, :proffesion, :email, :password, :password_confirmation, :current_password) }
  end

end
