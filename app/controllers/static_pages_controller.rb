class StaticPagesController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    # if logged_in?
    # 	@post = current_user.posts.build
    # 	@feed_items = current_user.feed.paginate(page: params[:page])
    # end
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
  	end
  end
end
