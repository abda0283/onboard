require 'test_helper'


describe "rooms integration" do


		#  load in test data

	fixtures :rooms

	it "should have a title on the indivdual room page" do 

			# lets find the room from the data

			@room = rooms(:steer)

			# visit is running this in the background 

			visit room_path(@room)


			# page comes from capybara gem


			page.text.must_include "adams room"

	end

	# testing tittles on the home page
	it "should have title on the homepage " do 

		visit root_path
		page.text.must_include "steer"
	end


end
