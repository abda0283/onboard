require 'test_helper'

describe Room do 

# load in the data from fixtures/room.yml

fixtures :rooms

	it "should get a latitude" do 

	# find the room in my fixtures which doesnt have the lat

	@room = rooms(:to_geocode)

	# force geocoding 

	@room.to_geocode

	# lets check if its not empty 

	@room.latitude.wont_be_nil


	end


	it "should get a longitude" do 
		@room = rooms(:to_geocode)
		@room.geocode
		@room.longitude.wont_be_nil


	end

	it "should be over 50p " do 

		@room=rooms(:riks)
		@room.price = 0.49
		@room.save.must_equal  false

		@room.price = 0.50
		@room.save.must_equal  true


	end








end