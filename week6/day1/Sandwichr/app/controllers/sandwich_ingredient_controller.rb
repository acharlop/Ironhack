class SandwichIngredientController < ApplicationController
	def create
		sandwich = load_sandwich
		ingredient = load_ingredient
		return unless sandwich || ingredient

		sandwich.ingredients.push(ingredient)
		sandwich.save
		
		render json: {sandwich: sandwich, ingredients: sandwich.ingredients}
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

	def load_ingredient
		ingredient = Ingredient.find_by(ingredient_params)
		unless ingredient
			render json: {error: "ingredient not found"},
				status: 400
			return
		end

		ingredient
	end


	def ingredient_params
		params.require(:ingredient).permit(:id)
	end

end
