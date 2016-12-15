class User < ApplicationRecord
	has_many :links, dependent: :destroy
	before_save { self.email = email.downcase }
	validates(:name, presence: true, length: {maximum: 50})
	
	has_secure_password
	validates(:password, presence: true, length: {minimum: 6})

	def User.digest(string)
	   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	   BCrypt::Password.create(string, cost: cost)
	end
end
