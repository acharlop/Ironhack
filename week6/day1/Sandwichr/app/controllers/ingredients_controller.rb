class IngredientsController < ApplicationController

	def create
		ingredient = Ingredient.create(ingredient_params)
		render json: ingredient
	end

	def destroy
		ingredient = load_ingredient
		return unless ingredient

		ingredient.destroy
		render json: ingredient
	end

	def show
		ingredient = load_ingredient
		return unless ingredient

		render json: ingredient
	end

	private

	def load_ingredient
		ingredient = Ingredient.find_by(id: params[:id])
		unless ingredient
			render json: {error: "ingredient not found"},
				status: 400
			return
		end

		ingredient
	end

	def ingredient_params
		params.require(:ingredient)
			.permit(:name, :calories)
	end

end
