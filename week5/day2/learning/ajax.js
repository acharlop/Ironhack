$(".js-character-ajax").click(function() {
	$.ajax({
		url: 'https://ironhack-characters.herokuapp.com/characters',
		success: function(theData) {
			theData.forEach( function(character) {
				var html = `
					<li>
						<p>Name: ${character.name}</p>
						<p>Occupation: ${character.occupation}</p>
					</li>
				`
				$(".js-character-list").append(html)
			})
		},
		error: function () { console.log("It failed :(")}
	});
	
});