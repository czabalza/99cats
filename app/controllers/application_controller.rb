class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def login_user!
    session[:session_token] = User.find_by_user_name(params['user']['user_name']).session_token
  end
end
