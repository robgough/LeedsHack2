class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if (@user.save)
  		redirect_to root_url, :notice => "You're so cool, we've let you in!"
  	else
  		render "new"
  	end
  end
end
