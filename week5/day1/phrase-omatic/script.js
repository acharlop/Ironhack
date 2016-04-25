// PHRASES METHODS
var phrases = [
	"Say hello to my little friend",
	"You got to ask yourself one question. Do you feel lucky? Well do ya punk?",
	"Sticks and stones can break you face, words can get you the death penalty",
	"Why oh why didn\'t I take the blue pill?"
]

function rand_phrase () {
	 $("#phrase").text(
	 	phrases[Math.floor(Math.random()*phrases.length)]
	 	)
}

function new_phrase (text) {
	phrases.push(text);
}

function display_phrase(text) {
	$("ul").append("<li>"+text + 
	'<a href="#" class="remove">X</a>'+"</li>")
}

function remove_phrase (idx) {
	phrases.splice(idx, 1)
}

// JQUERY FUNCTIONS

$(document).ready(function() {
	rand_phrase()

	// initial load of phrases into ul
	phrases.forEach( function(text) {
		display_phrase(text)
	})

	// refresh the phrase
	$("button").click(function(event) {
		event.preventDefault()
		rand_phrase()
	});

	// handle form submition
	$("form").on('submit', function() {
		event.preventDefault()
		var val = $("input").val()

		new_phrase(val)
		display_phrase(val)

		$("input").val("")
	});

	// hide / show phrases list
	$("#show-list").click(function() {
		$("ul").slideToggle("slow", function() {
			// change after completion
			var text = $("#show-list").text().split(" ")[0]
			$("#show-list").text((text == "Hide" ? "Show" : "Hide") + " Phrases")
		})
	});

	// remove from array / ul on remove click
	$("ul").on('click', 'li a', function(event) {
		event.preventDefault();
		var li = $(this).parent()
		remove_phrase(li.index())
		li.remove()
	});

});
