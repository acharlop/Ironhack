iron_character.get_characters(build_list)


$(".js-create-new").on('submit', function(event) {
	event.preventDefault()
	var data = {}
	var fields = ["name","occupation","weapon","debt"]
	fields.forEach( function(f) {
		data[f] = $(`#${f}`).val()
		$(`#${f}`).val("")
	})

	iron_character.post_character(data, do_cool_shit)

});

function do_cool_shit (data) {
	iron_character.get_characters(function(d){
		data = d.splice(iron_character.count)
		build_list(data)
	})
}



function build_list (data) {
	 data.forEach( function(character, index) {
	 	html = `
			<li>
				<h2>${character.name}</h2>
				<ul class="details-list">
					<li>ID: ${character.id}</li>
					<li>Occupation: ${character.occupation}</li>
					<li>Weapon ${character.weapon}</li>
					<li>Debt: ${character.debt}</li>
				</ul>
			</li>
	 	`
	 	$(".character-list").append(html)
	 });
}

		