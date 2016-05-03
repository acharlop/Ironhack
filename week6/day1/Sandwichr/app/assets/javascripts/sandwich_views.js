// $.get('/api/sandwiches', function(data) {
// 	var list = $(".js-sandwich-list")
// 	data.forEach( function(samich) {
// 		list.append( buildHtmlSandwich(samich) )
// 	})
// })
// .fail(function(error) {
// 	console.log(error);
// })

// function buildHtmlSandwich(s) {
// 	return `
// 		<li>
// 			<a href="/sandwiches/${s.id}" 
// 				 class="sandwich-dot-sexy">
// 				 ${s.name}
// 			 </a>
// 		</li>
// 	`
// }

// $(document).on('ready', function() {
// 	// $(".js-sandwich-list").on('click', '.sandwich-dot-sexy', function(event) {
// 	// 	event.preventDefault();
		
// 	// 	console.log(this)
// 	// 	/* Act on the event */
// 	// });
// });