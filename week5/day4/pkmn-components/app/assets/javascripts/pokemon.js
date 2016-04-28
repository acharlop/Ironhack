// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
PokemonApp.Pokemon = function (pokemonUri) {
	this.id = PokemonApp.Pokemon.idFromUri(pokemonUri)
}

PokemonApp.Pokemon.prototype.render = function () {
	console.log("Rendering pokemon: # " + this.id)

	var self = this

	$.ajax({
		url: "/api/v2/pokemon/" + this.id,
		success: function (response) {
			self.info = response
			console.log("Pokemon info:")
			console.log(self.info)

			$(".js-pkmn-name").text(self.info.name)
			$(".js-pkmn-number").text(self.info.id)
			$(".js-pkmn-height").text(self.info.height)
			$(".js-pkmn-weight").text(self.info.weight)

			self.info.stats.forEach( function(stat) {
				var val = stat.base_stat
				var name = stat.stat.name
				$(".js-pkmn-"+name).text(val)
			});

			$(".js-pkmn-types ul").empty()
			self.info.types.forEach(function(type){
			  $(".js-pkmn-types ul").append(`<li>${type.type.name}</li>`)
			})


			$(".js-pokemon-modal").modal("show")
		}
	})
	.fail(function(error){
		alert("Error getting Pokemon" + this.id)
		console.error(error.responseJSON)
	})

}

PokemonApp.Pokemon.idFromUri = function(pokemonUri) {
	var uriSegments = pokemonUri.split("/")
	var secondLast = uriSegments.length - 2
	return uriSegments[secondLast]
}

$(document).on('ready', function() {
	$(".js-show-pokemon").on('click', function(event) {
		var $button = $(event.currentTarget)
		var pokemonUri = $button.data("pokemon-uri")

		var pokemon = new PokemonApp.Pokemon(pokemonUri)
		pokemon.render()
	});
});