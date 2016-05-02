sandwiches = [
Sandwich.create(name: "BLT", bread_type: "cuban"),
Sandwich.create(name: "BLT", bread_type: "white"),
Sandwich.create(name: "Tuna", bread_type: "rye")
]

ingredients = [
Ingredient.create(name: "Letuce", calories: 0),
Ingredient.create(name: "mayo", calories: 50),
Ingredient.create(name: "musterd", calories: 2),
Ingredient.create(name: "ketchup", calories: 3),
Ingredient.create(name: "bacon", calories: 200),
Ingredient.create(name: "tomato", calories: 4),
Ingredient.create(name: "onion", calories: 5),
Ingredient.create(name: "tuna", calories: 25)
]


sandwiches.each { |samich|
	samich.ingredients.push(ingredients.sample)
	samich.ingredients.push(ingredients.sample)
	samich.ingredients.push(ingredients.sample)
}
