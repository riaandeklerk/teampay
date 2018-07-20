class SessionsController < ApplicationController
  def create
    #byebug
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to '/' # TODO: set it here for now - need to set a proper URL
    #redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
