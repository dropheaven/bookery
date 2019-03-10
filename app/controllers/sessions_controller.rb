class SessionsController < ApplicationController
  def new
  end

  def create
    if auth
      user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
        u.email = auth["info"]["email"]
        u.username = auth["info"]["name"]
        u.password = SecureRandom.hex
      end
      log_in(user)
      flash[:success] = "Logged in as #{user.username}"
      redirect_to root_path
    else
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        flash[:success] = "Logged in as #{user.username}"
        redirect_to root_path
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render :new
      end
    end
  end

  def destroy
    log_out
    flash[:danger] = "Logged out sucessfully"
    redirect_to root_url
  end

  private
    def session_params
      params.permit(:username, :password)
    end

    def auth
      request.env['omniauth.auth']
    end
end
