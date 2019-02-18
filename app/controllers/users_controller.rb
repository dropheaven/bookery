class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit 
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end