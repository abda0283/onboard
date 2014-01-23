class SessionsController < ApplicationController

# sessions are the browser tracks me, we want to manage them in our app, sessions controller deals with th
# this stuff
	
	def new

		#  log in form

	end




	def create

		# do the log in

		#  i want to find the username and password type in, want to see a username with those details, 
		@username = params[:session][:username]

		@password = params[:session][:password]

		# I want to see a user with that username

		@user = User.find_by_username(@username)

		# if there is user, and then check the passwor aswell

		if @user.present? and @user.authenticate(@password)

			# if it matches give them the session

			session[:user_id] = @user.id

			flash[:success] = " you're logged in"

			redirect_to root_path

		else

			flash[:error] = "wrong username/password"

			render "new"

			#  show new page

		end 



		#  check their password as, if there is a match, give them a session, if not, show new page






	end 






	def destroy
	#  log out , clear the session,

		reset_session
		flash[:success] = "you've logged out"

		redirect_to root_path


	end






end
