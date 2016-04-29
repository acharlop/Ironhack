$(".artist-button").click(function(e) {
	var $button = $(event.currentTarget)
	var artistID = $button.data('artist-id')
	var url = "https://api.spotify.com/v1/artists/" + artistID

	$.get(url, function(data) {
		if(data.images.length > 0) {
			var i = data.images.length -2
			$(".artist-cover img").attr('src', data.images[(i >= 0 ? i : 0)].url);

			url += "/top-tracks?country=US"
			$.get(url, function(data) {
				var html = ""
				data.tracks.forEach( function(song) {
					html += `
						<li>
							<button class="js-top-track" data-track-id="${song.id}">
								${song.name}
							</button>
							<hr>
						</li>`
				})
				// var pos = html.lastIndexOf("<hr>")
				// var html = html.substring(0,pos) + html.substring(pos+6)
				// console.log(html)
				$(".tracks-list").append(html)
			});
		}
	})
	// $(".author-widget")
	// $(".track-widget")
});