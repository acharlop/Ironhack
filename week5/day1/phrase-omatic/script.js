// PHRASES METHODS
var phrases = new Array(
	"Say hello to my little friend",
	"You got to ask yourself one question. Do you feel lucky? Well do ya punk?",
	"Sticks and stones can break you face, words can get you the death penalty",
	"Why oh why didn\'t I take the blue pill?"
)

function rand_phrase () {
	 $("#phrase").text(
	 	phrases[Math.floor(Math.random()*phrases.length)]
	 	)
}

function new_phrase (text) {
	phrases.push(text);
}

// JQUERY FUNCTIONS

$(document).ready(function() {
	rand_phrase()

	$("button").click(function(event) {
		event.preventDefault()
		rand_phrase()
	});

	$("form").on('submit', function() {
		event.preventDefault()
		var val = $("input").val()
		// newPhrase(val)
		new_phrase(val);
		$("input").val("")
	});

});
