// PHRASES METHODS
function rand_phrase () {
var phrases = [
	"Say hello to my little friend",
	"You got to ask yourself one question. Do you feel lucky? Well do ya punk?",
	"Sticks and stones can break you face, words can get you the death penalty",
	"Why oh why didn\'t I take the blue pill?"
]
	 $("#phrase").text(
	 	phrases[Math.floor(Math.random()*phrases.length)]
	 	)
}

// JQUERY FUNCTIONS

$(document).ready(function() {
	rand_phrase()

	$("button").click(function(event) {
		event.preventDefault()
		rand_phrase()
	});

});
