class ApplicationController < ActionController::Base
  
  # protect_from_forgery with: :exception
  
  # include SessionsHelper

  # 	private
  #   # Confirms a logged-in user.
  #   def logged_in_user
  #     unless logged_in?
  #       store_location
  #       flash[:danger] = "Please log in."
  #       redirect_to login_url
  #     end
  #   end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  end
end
end