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
	// list_to_dom(tag,list)
	api.add2dom(tag,list,api.liTracks) 
}

function do_cool_shit (data, type) {
	var list = []
	var thumb = "https://placeholdit.imgix.net/~text?txtsize=25&txt=N/A&w=64&h=64"
	data.forEach( function(item) {
		if (item.images.length > 0)
			thumb = item.images[item.images.length -1].url
		var obj = {
			name: item.name,
			type: type
		}
		if(type == "tracks") {
			obj.number = item.track_number
			obj.url = item.preview_url
		} else {
			obj.img = thumb
			obj.id = item.id
		}
		list.push(obj)
	})
	return list
}


//
function process_albums (data) {
	var type = "albums"
	data = do_cool_shit(data.items, type)
	api.add2dom($(".artist-list"), data, api.liAlbums)
	// add_to_dom(`.artist-list`, data, type)
}



String.prototype.trunc = String.prototype.trunc ||
  function(n){
      return (this.length > n) ? this.substr(0,n-1)+'&hellip;' : this;
  };


