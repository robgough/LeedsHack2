class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to dashboard_url
    end
  end

  def create
  	user = User.authenticate(params[:email].downcase, params[:password])
  	if user
  		session[:user_id] = user.id
  		redirect_to dashboard_url
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
