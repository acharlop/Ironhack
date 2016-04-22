class LoginController < ApplicationController
	skip_before_filter :require_login

	def try
		if @user = User.authenticate(login_params)
			session[:current_user_id] = @user.id
			redirect_to user_path(@user)
		else
			flash[:alert] = "Login was unsuccessful"
			redirect_to root_path
		end
	end

	def logout
		session[:current_user_id] = nil
		redirect_to root_path
	end


	private

	def login_params
		params.permit(:email, :password)	
	end
end
