class Sandwich < ActiveRecord::Base
	has_many :sandwich_ingredients
	has_many :ingredients, through: :sandwich_ingredients,  
		after_add: :calculate_total_calories

	private

	def calculate_total_calories ingredient
			self.total_calories += ingredient[:calories]
			self.save
	end


end
