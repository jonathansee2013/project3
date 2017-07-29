class UsersController < ApplicationController

before_action :check_if_logged_in, only: [:edit, :update, :destroy]
before_action :check_if_admin, only: [:index]
before_action :get_user, only: [:show, :edit, :update]

  def get_user
    @user = User.find params["id"]
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new user_params

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      raise "hell"
      redirect_to signup_path

    end

  end

  def edit
    redirect_to root_path unless @current_user == @user
  end

  def update

    @user = @current_user
    @user.update user_params

    redirect_to user_path(params["id"])

  end

  def destroy
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end