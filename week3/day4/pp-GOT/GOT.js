var fs = require('fs')
function fileActions(err, file){ 
    if (err) {
        throw err
    }
    doSomeCoolShit(JSON.parse(file))
    
}
fs.readFile("./GoTEpisodes.json", 'utf8', fileActions)

function doSomeCoolShit(array) {
    var episode_array = []
		array.forEach( function(eps) {
    	episode_array[eps.episode_number] = new Episode(eps)
    })


// 		PRINTS ALL EPISODES 
// 
    // episode_array.forEach( function(eps) {
    // 	eps.print()
    // })

// 		PRINTS ONLY THE AWESOMEST

    // episode_array.forEach( function(eps) {
    // 	if (eps.ep_ratin >= 8.5)
    // 		eps.print()
    // })


// 		PRINTS ONLY THE AWESOMEST

    episode_array.forEach( function(eps) {
    	if (eps.inEpisode("Jon"))
    		eps.print()
    })
}




function Episode(episode) {
	this.ep_title = episode.title
	this.ep_descr = episode.description
	this.ep_ratin = episode.rating
	this.ep_numbr = episode.episode_number
}

Episode.prototype.printTitle = function(){
	 console.log("Title:",this.ep_title,"  Episode #:",this.ep_numbr)
}

Episode.prototype.printDescription = function(){
	 console.log(this.ep_descr)
}

Episode.prototype.printRating = function(){
	 console.log("Rating:",this.ep_ratin,this.ratingStars())
}

Episode.prototype.ratingStars = function(){
		var rating = Math.round(this.ep_ratin)
	 return "*".repeat(rating)
}

Episode.prototype.inEpisode = function(character){
	return this.ep_descr.includes(character)
}

Episode.prototype.print = function(){
		this.printTitle()
		this.printDescription()
		this.printRating()
		console.log()
}