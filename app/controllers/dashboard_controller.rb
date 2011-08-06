class DashboardController < ApplicationController
	def home
		@date_text = params[:active_date]
		@active_date = Date.strptime(@date_text, "%Y_%m_%d") if @date_text
		@active_date ||= Date.today

		@foods = Food.by_user_on_date(current_user, @active_date)
		@weight = Weight.by_user_on_date(current_user, @active_date)[0]
	end
end
