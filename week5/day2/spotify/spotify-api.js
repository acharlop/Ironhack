function process_tracks(data) {
	list = []
	data.items.forEach( function(track) {
		list.push({
			number: track.track_number,
			name: track.name,
			url: track.preview_url
		})
	})

	var tag = $(".artist-list")
	list_to_dom(tag,list)
}



function list_to_dom(tag,list) {
	tag.empty()
	list.forEach( function(item) {
		var html = api.liTracks(item)
		tag.append(html)
	})
}


//
function process_album (data) {
	list = []
	data.items.forEach( function(album) {
		var thumb = "https://placeholdit.imgix.net/~text?txtsize=25&txt=N/A&w=64&h=64"
		if (album.images.length > 0)
			thumb = album.images[album.images.length -1].url
		list.push({
			name: album.name,
			id: album.id,
			img: thumb
		})
	})
	add_to_dom(".artist-list",list,"albums")
}


function process_data(data) {
	list = []
	data.artists.items.forEach( function(artist, i) {
		var thumb = "https://placeholdit.imgix.net/~text?txtsize=25&txt=N/A&w=64&h=64"
		if (artist.images.length > 0)
			thumb = artist.images[artist.images.length -1].url
		list.push({
			name: artist.name,
			id: artist.id,
			img: thumb
		})
	})
	add_to_dom(".artist-list",list,"artists")
}

function add_to_dom(selector, data, type) {
	var tag = $(selector)
	tag.empty()
	type = (type == "artists" ? "searchAlbums" : "searchTracks")

	data.forEach( function(item) {
		var html = `
		<li>
			<a class="js-${item}" href="#" onclick='api.${type}("${item.id}")'>
				<img class="item-thumb" src=${item.img}> 
				<h2 class="item-name">${item.name}</h2>
			</a>
		</li>
		`
		tag.append(html)
	})		
}




String.prototype.trunc = String.prototype.trunc ||
  function(n){
      return (this.length > n) ? this.substr(0,n-1)+'&hellip;' : this;
  };


