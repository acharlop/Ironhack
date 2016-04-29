$(".search-form").on('submit', function(event) {
	event.preventDefault();
	var term = encodeURIComponent($("#search").val())
	this.reset();

	var url = "https://api.spotify.com/v1/search?type=track&q=" + term


	$.get(url, function(data) {
		if (data.tracks.items.length > 0){

			var track = data.tracks.items[0]
			$(".title").text(track.name)
			$(".author").text(track.artists[0].name)
			$("#player").attr('src', track.preview_url)
			$("#player").load();
			$("progress").attr('value', 0)

			var img = ""
			if(track.album.images.length > 0)
				img = track.album.images[0].url
			$(".cover img").attr("src",img)

			$(".btn-play").removeClass("disabled")
			// console.log(track)
		} else {
			console.error(data)
		}

	})
	.fail(function() {
			console.log("error");
	})

	// console.log(term)
	/* Act on the event */
});

