class ProductsController < ApplicationController
	def index
		@user = User.by_id params[:user_id]
		@products = @user.products.order(title: :desc).limit(10)
	end

	def new
		@user = User.by_id params[:user_id]
		@product = @user.products.new
	end

	def create
		@user = User.by_id params[:user_id]
		@product = @user.products.new(product_params)
		if @product.save
			flash[:notice] = "Product created successfully"
			redirect_to user_products_path
		else
			flash[:alert] = "Error creating product"
			render "new"
		end
	end

	def show
		@user = User.by_id params[:user_id]
		@product = @user.products.find params[:id]
	end

	def destroy
		Product.destroy params[:id]
		redirect_to :action => "index"
	end

	private

	def product_params
		params.require(:product).permit(:title, :description, :deadline)
	end
end
