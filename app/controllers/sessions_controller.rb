class SessionsController < ApplicationController
  def create
    # puts "%"*50
    # puts "in sessions controller create"
    # puts "%"*50
  	user = User.from_omniauth(env["omniauth.auth"])
  	session[:user_id] = user.id
  	redirect_to root_url
  end

  def destroy
    # puts "%"*50
    # puts "in sessions controller destroy"
    # puts "%"*50
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
