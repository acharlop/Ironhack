$(document).ready(function() {
	
	$("#hide").click(function(event) {
		$(".container").slideToggle(5000);
		var text = $(this).text()
		$(this).text(text == "HIDE!" ? "Unhide" : "HIDE!")
	});


	$("#js-unicorn-mode").click(function() {
		$("body, body *").each( function(i,tag) {
			$(tag).attr('style',random_gradient())
		});
	});

	$("#js-un-unicorn").click(function() {
			$("body, body *").attr('style','');
	});


});


function random_color() {
	 return '#'+Math.floor(Math.random()*16777215).toString(16);
}

function random_gradient() {
	var top_color = random_color();
	var color = random_color() + ", " + random_color() + ");";

	var gradient = "background-color: " + top_color + ";";
	gradient += "background-image: -webkit-linear-gradient(top, " + color;
	gradient += "background-image:    -moz-linear-gradient(top, " + color;
	gradient += "background-image:      -o-linear-gradient(top, " + color;
	gradient += "background-image:         linear-gradient(to bottom, " + color;
	
	console.log(gradient);

	return gradient;
}