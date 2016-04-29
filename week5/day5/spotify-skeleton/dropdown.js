var typingTimer
$("#search").bind('keydown', function(e) {
	// console.log(e)
	clearTimeout(typingTimer)
	typingTimer = setTimeout(doneTyping,750)
})

function doneTyping () {
	var value = $("#search").val()
	if (value == "") return
	var url = "https://api.spotify.com/v1/search?type=track&q=" + value
	$.get(url, function(data) {
		// console.log(data)
		var html = ""
		data.tracks.items.forEach( function(song) {
			html += `<option value="${song.name}">Test</option>`
		});
		$("#songs").empty()
		$("#songs").append(html)
	})
	.fail(function(error) {
		console.log();
	})  
}