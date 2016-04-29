var typingTimer
$("#search").bind('keydown', function(e) {
	// console.log(e)
	clearTimeout(typingTimer)
	typingTimer = setTimeout(doneTyping,750)
})

function doneTyping () {
	var value = encodeURIComponent($("#search").val())
	if (value == "") return
	var url = "https://api.spotify.com/v1/search?type=track&q=" + value
	$.get(url, function(data) {
		var html = ""
		data.tracks.items.forEach( function(song) {
			html += `<option value="${song.name}">
									<a href="#">${song.artists[0].name}</a>
							 </option>`
		});
		$("#songs").empty()
		$("#songs").append(html)
	})
	.fail(function(error) {
		console.error(error.responseJSON);
	})  
	typingTimer = undefined
}

$("#search").on("input", function(event) {
	if (typingTimer === undefined)
		$(".search-form").trigger('submit')	
});