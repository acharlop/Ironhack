if("geolocation" in navigator) {
	var options = {
		enableHighAccuracy: true
	}
	navigator.geolocation.getCurrentPosition(onLocation,onError, options)
} else {
	alert("You don't have Geolocation. Time to upgrade your browser")
}

function onLocation(position) {
	console.log(position)
	$(".js-set-latitude").text(position.coords.latitude)
	$(".js-set-longitude").text(position.coords.longitude)

	var url = "https://maps.googleapis.com/maps/api/staticmap?size=800x1000&zoom=14&maptype=hybrid&center="
	url += position.coords.latitude + "," + position.coords.longitude
	url += "&markers=icon:http://4.bp.blogspot.com/-8I37UdAZmfs/UP7ohOqll7I/AAAAAAAAGlU/YOiNj5dvaf0/s1600/asian-kid-sunglasses.gif|"
	url += position.coords.latitude + "," + position.coords.longitude

	// $.get(url, function(data) {
		$(".static-map").attr('src', url);
	// });
}

function onError(error){
	console.error(error)
}

