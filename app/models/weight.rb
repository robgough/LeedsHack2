class Weight < ActiveRecord::Base
	belongs_to :user

	attr_accessible :pounds, :date

	validates_presence_of	:date
	validates_presence_of	:pounds

	def self.by_user_on_date(user, date)
		where(:user_id => user.id, :date => date)
	end
end
# == Schema Information
#
# Table name: weights
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  pounds     :float
#  date       :date
#  created_at :datetime
#  updated_at :datetime
#

