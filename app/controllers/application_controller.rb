class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:error] = "You cann't view this page."
    redirect_to root_path
  end

  	def after_sign_in_path_for(resource)
    	request.env['omniauth.origin'] || stored_location_for(resource) || edit_user_path(@user)
  	end
end