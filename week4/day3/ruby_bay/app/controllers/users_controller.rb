class UsersController < ApplicationController
	def index
		@users = User.order(name: :desc).limit(10)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			flash[:notice] = "User created successfully"
			redirect_to users_path
		else
			flash[:alert] = "Error creating user"
			render "new"
		end
	end

	def show
		@user = User.by_id params[:id]
	end

	def destroy
		user = User.destroy params[:id]
		redirect_to :action => "index"
	end

	def edit
		@user = User.find params[:id]
	end

	def update
		@user = User.find params[:id]
		if @user.update user_params
			flash[:notice] = "User updated successfully"
			redirect_to users_path
		else
			flash[:alert] = "Error updating user"
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email)
	end
end
