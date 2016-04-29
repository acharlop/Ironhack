PokemonApp.Evolve.render = function(id) {
	console.log(this)
}

$(document).on('ready', function() {
	$(".js-pkmn-evolve").on('click', function(event) {
		var $button = $(event.currentTarget)
		var pokemonId = $button.data("pkmn-id")

		$.ajax({
			url: '/api/v2/evolution-chain/' + pokemonId,
			success: function(response){
				

			}
		})
		.done(function() {
			console.log("success");
		})
		.fail(function() {
			console.log("error");
		})
		.always(function() {
			console.log("complete");
		});
		
	});

});