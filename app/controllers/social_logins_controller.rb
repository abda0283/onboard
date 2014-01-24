class SocialLoginsController < ApplicationController





		def create

			# get infor back from provider

			@auth = request.env['omniauth.auth']


			# info

			@provider = @auth[:provider]
			
			@provider_id = @auth[:uid]

			@provider_key = @auth[:credentials][:token]
			
			@provider_secret = @auth[:credentials][:secret]


			# check if a user is logged in as me
			# twittr id eqal to the one omnit auth gives back

			@users = User.where(provider: @provider, provider_id: @provider_id)

			if @users.any?

				# log me in as the first user

				@user = @users.first


			else

				# create me a new user using info

				@user = User.new 
				@user.provider = @provider
				@user.provider_id = @provider_id
				@user.provider_key = @provider_key
				@user.provider_secret = @provider_secret


				@user.email = @auth[:info][:email]
				
				@user.name = @auth[:info][:name]

				@user.username = @auth[:info][:nickname]

				@user.password = "!!!!!!!!!"

				@user.password_confirmation = "!!!!!!!!!"

				@user.save

				# @user.save! for testing purposes


			end


			#  give them a site cookie to be signed in with

			session[:user_id] = @user.id

				flash[:success] = "you're logged in to onboard"
				redirect_to root_path

		end


		def failure



			#  if we cancel or forget our lgin details

			redirect_to new_user_path


		end


end
