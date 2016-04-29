$(".search-form").on('submit', function(event) {
	event.preventDefault();
	var term = $("#search").val()
	this.reset();
	console.log(term)
	/* Act on the event */
});