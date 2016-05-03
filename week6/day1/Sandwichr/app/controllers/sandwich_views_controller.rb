class SandwichViewsController < ApplicationController
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


	end
end
