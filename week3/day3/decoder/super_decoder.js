var decode = require("./decoder.js");

function getWords(count) {
	var use
	switch (count) {
		case "all":
			return function(n) { return ++n;}
			break;
		case "odd":

			break;
		default:
			// statements_def
			break;
	}

}


function super_decode(sentence, behavior="all-forwards") {
	var arr = [];
	arr = direction.contains("backwards") ? sentence.split(" ").reverse() : sentence.split(" ");
	
	if (direction.contains("even"))
		var start = 1;
	else if (direction.contains("odd"))
		var start = 0;

	if 
}