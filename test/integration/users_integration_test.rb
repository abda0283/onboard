require "test_helper"



describe "signup integration" do

	fixtures :user

	it "should have a form" do
		visit new_user_path
		page.text.must_include "Username"

	end

	it "should not signup straight away" do


		#  its actually gonna do this in an invisible browser
		visit new_user_path
		click_button "sign up"

		# we can find the current url by using the current_path

		current_path.wont_equal root_path

	end

	it " should add a user if filled in" do
		visit new_user_path

		fill_in "Name", with: "rik"
		fill_in "Username", with: "riktest"
		fill_in "Email", with: "Email@email.com"
		fill_in "user_password", with: "password"
		fill_in "user_password_confirmation", with: password 

		click_button "sign up"




		current_path.must_equal root_path

	end




end