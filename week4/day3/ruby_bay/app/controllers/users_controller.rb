class UsersController < ApplicationController
	def index
		@users = User.order(name: :desc).limit(10)
	end

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

	def destroy
		user = User.destroy params[:id]
		redirect_to :action => "index"
	end
end
