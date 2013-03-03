class WeightsController < ApplicationController
  def create
  	active_date = Date.strptime(params[:active_date], "%Y_%m_%d") if params[:active_date]
  	pounds = params[:weight_in_pounds].to_f

  	if pounds == nil || pounds == 0
  		stone_weight_array = params[:weight_in_stone].split(' ')
  		pounds = stone_weight_array[0].to_f * 14
  		pounds = pounds + stone_weight_array[1].to_f
  		pounds = pounds + stone_weight_array[2].to_f
  	end
  	
  	if current_user && pounds  > 0
  		existing_weight = Weight.by_user_on_date(current_user, active_date)[0]
  		if (existing_weight)
  			existing_weight.pounds = pounds
  			existing_weight.save!
  		else
  			current_user.weights.create!(:pounds => pounds, :date => active_date)
  		end
  	end
     
    redirect_to :controller => 'dashboard', :action => 'home', :active_date => params[:active_date]
  end

  def show
    @mode = params[:mode]

    @weights = Weight.find_all_by_user_id(params[:id], :order => 'date desc') if @mode == "all"
    @weights = Weight.where("user_id = ? AND date > ?", params[:id], 365.days.ago).order("date desc")  if @mode == "year"
    @weights = Weight.where("user_id = ? AND date > ?", params[:id], 30.days.ago).order("date desc") if @mode == "month" || @weights.nil?

    respond_to do |format|
      format.json { render :json => @weights.to_json(:only => [:date, :pounds]) }
      format.xml { render :xml => @weights.to_xml(:only => [:date, :pounds]) }
    end
  end

end
