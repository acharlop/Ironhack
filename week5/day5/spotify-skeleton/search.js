
$(".search-form").on('submit', function(event) {
	event.preventDefault();
	var term = encodeURIComponent($("#search").val())
	this.reset();

	var url = "https://api.spotify.com/v1/search?type=track&q=" + term
	$.get(url, function(data) {
		if (data.tracks.items.length > 0){
			var track = data.tracks.items[0]
			$(".js-title").text(track.name)
			$(".js-author").text(track.artists[0].name)
			$(".artist-button").removeAttr('disabled')
			$(".artist-button").data('artist-id', track.artists[0].id )
			$("progress").attr('value', 0)
			$("#player").attr('src', track.preview_url)
			$("#player").load()
			if(!$("#player").prop("paused")) {
				$("#player").trigger("play")
			}

			var img = ""
			if(track.album.images.length > 0)
				img = track.album.images[0].url
			$(".cover img").attr("src",img)

			$(".btn-play").removeClass("disabled")

			$("#songs").empty()
			console.log(track)
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

