class UsersController < ApplicationController
  before_filter :authenticate, :only => [:update, :settings]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    @user.email.downcase!
  	if (@user.save)
  		redirect_to root_url, :notice => "You're so cool, we've let you in!"
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(params[:id])

    if !@user.public_profile && @user != current_user
      flash[:notice] = "I'm afraid that user has set their profile to private."
      redirect_to dashboard_url
    end

    @weight_change = Array.new
    last_weight = nil

    @history_days = 30
    @history_days = @user.history_days if @user.history_days != nil && @user.history_days > 0

    (Date.today - @history_days).upto(Date.today) do |day|
      #@weight_change << day.to_s
      weight = @user.weights.find_by_date(day)

      if weight
        unless last_weight
          last_weight = weight.pounds
        else
          @weight_change << weight.pounds - last_weight
          last_weight = weight.pounds
        end
      else
        @weight_change << 0 if last_weight
      end
    end

    @total_loss = 0
    @weight_change.map do |x|
      @total_loss = @total_loss + x.to_f
    end

    @food_log = @user.foods.since(Date.today - 8).order('foods.date DESC') # 7 (days) - 1 = 8
  end

  def settings
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(:controller => 'dashboard', :action => 'home')
    else
      render :action => 'edit'
    end
  end
end
