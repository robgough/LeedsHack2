class Food < ActiveRecord::Base
	belongs_to :user

	attr_accessible :food, :calories, :date

	validates_presence_of		:date

	def self.by_user_on_date(user, date)
		where(:user_id => user.id, :date => date)
	end
end

# == Schema Information
#
# Table name: foods
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  food       :string(255)
#  calories   :integer
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

