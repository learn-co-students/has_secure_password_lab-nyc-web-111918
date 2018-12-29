class SessionsController < ApplicationController

  def new
  end

  def create
  user = User.find_by(name: params[:user][:username])
  user = user.try(:authenticate, params[:user][:password])

  return redirect_to(controller: 'sessions', action: 'new') unless user 

  session[:user] = user
  session[:user_name] = user.name
  

  redirect_to(controller: 'application', action: 'hello')
  end

  def destroy
  	session.delete :user
  	session.delete :user_name

  	redirect_to '/'
  end


end
