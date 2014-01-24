class User < ActiveRecord::Base


	#  associatations
	has_many :rooms


	# built into rails 3.2 , 4, for handling passwords
	
	has_secure_password

	#  validations

	validates :name, presence: true
	
	validates :username, presence: true, uniqueness: true

	validates :email, presence: true, uniqueness: true






end
