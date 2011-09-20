class User < ActiveRecord::Base
	attr_accessible :email, 
					:password, 
					:password_confirmation, 
					:name, 
					:next_goal_weight, 
					:daily_calories, 
					:public_profile,
					:history_days

	has_many :foods, :dependent => :destroy
	has_many :weights, :dependent => :destroy

	attr_accessor :password
	before_save :encrypt_password

	validates_confirmation_of 	:password
	validates_presence_of 		:password, :on => :create
	validates_presence_of		:email
	validates_uniqueness_of		:email

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password
		if (password.present?)
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end
end


# == Schema Information
#
# Table name: users
#
#  id               :integer         not null, primary key
#  email            :string(255)
#  password_hash    :string(255)
#  password_salt    :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  next_goal_weight :float
#  name             :string(255)
#  daily_calories   :string(255)
#  public_profile   :boolean         default(TRUE)
#  history_days     :integer
#

