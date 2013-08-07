class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= User.find session[:user_id] unless session[:user_id].nil?
  end

  def force_login
  	redirect_to "/login" if current_user.nil?
  end

  def admin_only
    redirect_to "/" unless @current_user.admin?
  end

  helper_method :current_user, :force_login
end
