
var iron_character = { 
	url: "https://ironhack-characters.herokuapp.com/characters",
	post_character, 
	get_characters,
	count: 0 }


function post_character (data,fn) {
	$.post(this.url, data, fn)
	.fail(function(err){ console.error(err.responseJSON) })
}

function get_characters(fn) {
	$.get(this.url,fn)
	.done(function(data){ this.count = data.length }) 
	.fail(function(err){ console.error(err.responseJSON) })
}
