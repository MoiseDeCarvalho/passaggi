class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper :current_user

	def current_user
    	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  	end
end
