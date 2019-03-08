class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def sign_in_to_access
    if !logged_in?
      flash[:notice] = "Sign in to complete this request"
      redirect_to login_path
    end
  end
end
