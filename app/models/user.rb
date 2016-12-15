class User < ApplicationRecord
	has_many :links, dependent: :destroy
	before_save { self.email = email.downcase }
	validates(:name, presence: true, length: {maximum: 50})
	
	has_secure_password
	validates(:password, presence: true, length: {minimum: 6})
end
