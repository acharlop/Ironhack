function buildHtmlSandwich(s) {
	var list = $(".ingredients-list").append(
	 ` <li> ${s.name} </li> `)
}

$(document).on('page:load', function() {
	$(".js-add-ingredient").on('submit', function(event) {
		event.preventDefault();
		var form = event.currentTarget
		var url = $("form").attr("action")
		var ing_id = $("#ingredient").val()
		var params = {
			"ingredient": {
				"id": ing_id
			}
		}

		$.post(url, params, function(data) {
			var calories = data.sandwich.total_calories
			var ingredient = data.ingredients[data.ingredients.length - 1]

			buildHtmlSandwich(ingredient)
			$(".total-calories").text("Calories: " + calories)
		})
		.fail(function(error) {
			console.log(error);
		})		
	})
})