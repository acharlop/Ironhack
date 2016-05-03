class SandwichViewsController < ApplicationController
	before_action :authenticate_user!

	def index
		@samiches = Sandwich.all
	end
	def show
		@samich = Sandwich.find_by(id: params[:id])
		unless @samich
			flash[:alert] = "Sandwich not found"
			redirect_to sandwiches_path
			return
		end

		@ingredients = Ingredient.all

	end
end
