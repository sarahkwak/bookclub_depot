# Session controller is mainly in charge or login/ logout
class SessionsController < ApplicationController
  skip_before_action :authorize

  # login
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  # logout
  def destroy
    session[:user_id] = nil
  end
end
