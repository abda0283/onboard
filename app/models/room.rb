class Room < ActiveRecord::Base


	# association
	belongs_to :user

	# this is fron the rubygeocoder.org site

	geocoded_by :address
	after_validation :geocode



	# validations

	validates :title, presence: true

	validates :address, presence: true
	
	# more than 50 pence

	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.5}


	





end
