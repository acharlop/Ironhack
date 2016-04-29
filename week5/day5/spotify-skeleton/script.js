$(".btn-play").on('click', function(event) {
	var self = $(event.currentTarget)
	if(!self.hasClass('disabled')){
		self.toggleClass("playing")
		if(self.hasClass("playing")) {
			$("#player").trigger('play')
		} else {
			$("#player").trigger("pause")
		}
	}
});

$("#player").on("playing", function() {
	intervalID = setInterval(function () {
    $("progress").attr('value',$("#player").prop("currentTime"))
	}, 1);
})

$("#player").on('pause', function() {
	clearInterval(intervalID)
});

$("#player").on("durationchange", function() {
	$("progress").attr('max',$("#player").prop("duration"))
})

$("#player").on("ended", function() {
	$(".btn-play").toggleClass("playing")
	clearInterval(intervalID)
})