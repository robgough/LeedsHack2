class FoodsController < ApplicationController
  before_filter :authenticate
  
  def create
  	active_date = Date.strptime(params[:active_date], "%Y_%m_%d") if params[:active_date]

  	if current_user
  		current_user.foods.create!(:food => params[:food], :calories => params[:calories], :date => active_date)
  	end
     
    redirect_to :controller => 'dashboard', :action => 'home', :active_date => params[:active_date]
  end

  def destroy
  	food = Food.find(params[:id])
  	food.destroy
  	redirect_to :controller => 'dashboard', :action => 'home', :active_date => params[:active_date]
  end
end
