class UsersController < ApplicationController
  before_action :logged_in?, except: [:show]

  def new
    render :new
  end

  def logged_in?
    redirect_to cats_url if current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password, :picture)
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
