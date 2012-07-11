class Weight < ActiveRecord::Base
	belongs_to :user

	attr_accessible :pounds, :date

	validates_presence_of	:date
	validates_presence_of	:pounds

	def self.by_user_on_date(user, date)
		where(:user_id => user.id, :date => date)
	end

	def ticks
		date.strftime("%s").to_i * 1000
	end

	def as_json(options = { })
	    h = super(options)
	    h[:ticks]   = ticks
	    h
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

