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

Episode.prototype.print = function(should_print){
		this.printTitle()
		this.printDescription()
		this.printRating()
		console.log()
}

module.exports = Episode