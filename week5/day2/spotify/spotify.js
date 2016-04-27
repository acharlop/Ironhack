$(".js-spotify-search-form").on('submit', function(event) {
	event.preventDefault();
	var term = $("#input").val()
						 $("#input").val("")

	spotify_api.search_artist( term, 
		function(data){ 
			console.log(data) 
		})
});



$(".js-artist").click(function(event) {
	console.log("here")
});


