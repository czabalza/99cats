class SessionsController < ApplicationController
  before_action :logged_in?, except: [:destroy]

  def logged_in?
    redirect_to cats_url if current_user
  end

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:session][:user_name], params[:session][:password])
    if user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
end
