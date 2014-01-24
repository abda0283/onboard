class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # lets make a shortcute called currnt_user

  def current_user

  	if session[:user_id].present?
  		User.find(session[:user_id])

  	end

  end 

# make the shortcute above available in our views 
#  as well as our controllers

helper_method :current_user

#  lets add in an action to make anyone log out to go to the sign up page

	def make_sure_logged_in

		if current_user.nil?

		flash[:error] = "You need to be signed up"

		redirect_to new_user_path


		end




	end


end
