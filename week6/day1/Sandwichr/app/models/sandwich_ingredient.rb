class SandwichIngredient < ActiveRecord::Base
	belongs_to :ingredient
	belongs_to :sandwich
end
