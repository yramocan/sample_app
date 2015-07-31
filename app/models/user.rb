class User < ActiveRecord::Base
	# Make email lowercase before adding to database
	before_save { self.email = email.downcase }

	# Name Validations
	validates :name, presence: true, length: { maximum: 50 }

	# Email Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
			  format: { with: VALID_EMAIL_REGEX },
			  uniqueness: { case_sensitive: false }

	# Password Validations
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
