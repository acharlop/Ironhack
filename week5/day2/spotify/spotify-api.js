var spotify_api = {
	url: "https://api.spotify.com/v1/",
	search_artist,
	search_albums
}

function search_artist(arg) {
	var url = `${this.url}search?type=artist&query=${arg}`
	$.get(url, process_data)
}

function search_albums(id) {
	var url = `${this.url}artists/${id}/albums/`
	$.get(url, process_data)
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
	add_to_dom(".artist-list",list)
}

function add_to_dom(selector, data) {
	var tag = $(selector)
	tag.empty()
	data.forEach( function(item) {
		var html = `
		<a class="js-${item}" href="#" onclick='search_albums("${item.id}")'>
			<li>
				<img class="item-thumb" src=${item.img}> 
				<h2 class="item-name">${item.name.trunc(23)}</h2>
			</li>
		</a>
		`
		tag.append(html)
	})		
}


String.prototype.trunc = String.prototype.trunc ||
  function(n){
      return (this.length > n) ? this.substr(0,n-1)+'&hellip;' : this;
  };