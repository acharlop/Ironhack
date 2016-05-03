class SessionsController < ApplicationController

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/'
		else
			if !user 
				flash[:error] = "Email: \'" << params[:email] << "\'' not found"
			else
				flash[:error] = "password is incorrect"
			end
			redirect_to "/login"
		end
	end

	def destroy
		session.destroy
		redirect_to "/"
	end

end
