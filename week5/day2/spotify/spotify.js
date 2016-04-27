var api = new SpotifyAPI()

$(".js-spotify-search-form").on('submit', function(event) {
	event.preventDefault();
	var term = $("#input").val()
						 $("#input").val("")

	api.searchArtist(term)
})

$(".artist-list").on('click', '.js-artists', function(event) {
	var id = $(event.currentTarget).attr('data-target').split("#")[1]
	// only run if empty
	if ($("#"+id+" li").length == 0) {
		api.id = id
		api.searchAlbums(id)
	}

});

// 

function SpotifyAPI() {
	var url = "https://api.spotify.com/v1"
	this.urls = { 
		artist_url: `${url}/search?type=artist&query=%REPLACE%`,
		albums_url: `${url}/artists/%REPLACE%/albums/`,
		tracks_url: `${url}/albums/%REPLACE%/tracks/`,
		id: ""
	}
}

SpotifyAPI.prototype.search = function(url,arg,fn){
	var url = url.replace(/%REPLACE%/, arg)
	$.get(url, fn.bind(this))
}

SpotifyAPI.prototype.processAlbums = function(data) {
	var type = "albums"
	data = do_cool_shit(data.items, type)
	this.add2dom($("#"+this.id+" ul"), data, this.liAlbums)
}

SpotifyAPI.prototype.processArtists = function(data) {
	var type = "artists"
	data = do_cool_shit(data.artists.items, type)
	this.add2dom($(".artist-list"), data, this.liArtists)
}

SpotifyAPI.prototype.processTracks = function(data) {
	var type = "tracks"
	data = do_cool_shit(data.items, type)
	this.add2dom($(".artist-list"), data, this.liTracks)
}

SpotifyAPI.prototype.searchArtist = function(arg) {
	this.search(this.urls.artist_url, arg, this.processArtists)
};

SpotifyAPI.prototype.searchAlbums = function(arg) {
	this.search(this.urls.albums_url, arg, this.processAlbums)
};

SpotifyAPI.prototype.searchTracks = function(arg) {
	this.search(this.urls.tracks_url, arg, process_tracks)
};

SpotifyAPI.prototype.liTracks = function(item){
	return `
	<li>
			<h2 class="item-name">${item.number}: ${item.name}</h2>
			<audio src="${item.url}" controls></audio>
		</a>
	</li>`
}

SpotifyAPI.prototype.liArtists = function(item){
	return `
		<li>
			<button data-toggle="collapse" data-target="#${item.id}" class="btn btn-default btn-block js-${item.type} text-left"'>
				<img class="item-thumb text-left img" src=${item.img}> 
				<h2 class="item-name">${item.name}</h2>
				
			</button>
				<div id="${item.id}" class="collapse">
					<ul></ul>
				</div>
		</li>
		`

	// return this.li_multiple(item, "searchAlbums")
}

SpotifyAPI.prototype.liAlbums = function(item){
	return this.li_multiple(item, "searchTracks")
}

SpotifyAPI.prototype.li_multiple = function(item,next){
	return `
		<li>
			<a class="js-${item.type}" href="#" onclick='api.searchTracks("${item.id}")'>
				<img class="item-thumb" src=${item.img}> 
				<h2 class="item-name">${item.name}</h2>
					<ul class="js-${item.type}-list"></ul>
			</a>
		</li>
		`
}

SpotifyAPI.prototype.add2dom = function (tag, list, fn) {
	tag.empty()
	var fnBound = fn.bind(this)
	list.forEach( function(item) {
		var html = fnBound(item)
		tag.append(html)
	})
}

//

