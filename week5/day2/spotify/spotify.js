var api = new SpotifyAPI()

$(".js-spotify-search-form").on('submit', function(event) {
	event.preventDefault();
	var term = $("#input").val()
						 $("#input").val("")

	api.searchArtist(term)
})


// 

function SpotifyAPI() {
	var url = "https://api.spotify.com/v1"
	this.urls = { 
		artist_url: `${url}/search?type=artist&query=%REPLACE%`,
		albums_url: `${url}/artists/%REPLACE%/albums/`,
		tracks_url: `${url}/albums/%REPLACE%/tracks/`
	}
}

SpotifyAPI.prototype.search = function(url,arg,fn){
	var url = url.replace(/%REPLACE%/, arg)
	$.get(url, fn)
}

SpotifyAPI.prototype.searchArtist = function(arg) {
	this.search(this.urls.artist_url, arg, process_data)
};

SpotifyAPI.prototype.searchAlbums = function(arg) {
	this.search(this.urls.albums_url, arg, process_album)
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
	this.li_multiple(item,searchAlbums)
}

SpotifyAPI.prototype.liAlbums = function(item){
	this.li_multiple(item,searchTracks)
}

SpotifyAPI.prototype.li_multiple = function(item,next){
	return `
		<li>
			<a class="js-${item}" href="#" onclick='api.${next}("${item.id}")'>
				<img class="item-thumb" src=${item.img}> 
				<h2 class="item-name">${item.name}</h2>
			</a>
		</li>
		`
}

//

