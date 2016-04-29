$(".btn-play").on('click', function(event) {
	var self = $(event.currentTarget)
	
	if(!self.hasClass('disabled')){
		self.toggleClass("playing")

			console.log($("#player").prop("duration"))

		if(self.hasClass("playing")) {
			$("#player").trigger('play')
		} else {
			$("#player").trigger("pause")
		}
	}
});


$("#player").on("durationchange", function() {
	$("progress").attr('max',$("#player").prop("duration"))
})

$("#player").on("timeupdate", function() {
	$("progress").attr('value',$("#player").prop("currentTime"))
})

$("#player").on("ended", function() {
	$(".btn-play").toggleClass("playing")
})