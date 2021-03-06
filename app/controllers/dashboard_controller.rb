class DashboardController < ApplicationController
	before_filter :authenticate

	def home
		@date_text = params[:active_date]
		@active_date = Date.strptime(@date_text, "%Y_%m_%d") if @date_text
		@active_date ||= Date.today

		@foods = Food.by_user_on_date(current_user, @active_date)
		@weight = Weight.by_user_on_date(current_user, @active_date)[0]

		@calorie_total = 0;
		@foods.each do |x|
			@calorie_total += x.calories if x.calories
		end
	end
end
