class SessionsController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
    def session_params
      params.permit(:username, :password)
    end
end
