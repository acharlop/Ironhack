class BidsController < ApplicationController
	def create
		@user = User.by_id session[:current_user_id]
		@product = @user.products.find params[:product_id]
		bid = Bid.new(
			amount: bid_params[:amount],
			user: @user,
			product: @product
			)
		if bid.save
			flash[:notice] = "Bid entered successfully"
		else
			flash[:alert] = "ERROR: Bid was not created"
		end
		redirect_to user_product_path(@user,@product)
	end

	private
	def bid_params
		params.require(:bid).permit(:amount)
	end
end
