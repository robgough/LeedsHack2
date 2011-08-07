class UsersController < ApplicationController
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

    @weight_change = Array.new
    last_weight = nil

    (Date.today - 30).upto(Date.today) do |day|
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
