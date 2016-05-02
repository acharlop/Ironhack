class SandwichesController < ApplicationController

	def index
		sandwiches = Sandwich.all
		render json: sandwiches
	end

	def create
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich
	end

	def show
		sandwich = load_sandwich
		return unless sandwich

		render json: {sandwich: sandwich, ingredients: sandwich.ingredients}
	end

	def update
		sandwich = load_sandwich
		return unless sandwich

		sandwich.update(sandwich_params)
		render json: sandwich
	end

	def destroy
		sandwich = load_sandwich
		return unless sandwich

		sandwich.destory
		render json: sandwich
	end

	private

	def load_sandwich
		sandwich = Sandwich.find_by(id: params[:id])
		unless sandwich
			render json: {error: "sandwich not found"}, status: 404
			return
		end

		sandwich
	end


	def sandwich_params
		params.require(:sandwich)
			.permit(:name, :bread_type)
	end

end
