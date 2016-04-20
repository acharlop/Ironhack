class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		new_user = User.new(
			name:  params[:user][:name],
			email: params[:user][:email]
		)
		new_user.save

		redirect_to "/users/#{new_user.id}"
	end

	def view
		@user = User.by_id params[:id]
	end
end
