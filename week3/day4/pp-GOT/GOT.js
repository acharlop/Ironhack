var fs = require('fs')
var Episode = require("./episode.js")


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

	// printer(episode_array, all)
	// printer(episode_array, best, 8.5)
	printer(episode_array, actor, "Jon")
}

function all 	(e) 				{ return true }
function best (e,rating) 	{ return e.ep_ratin >= rating }
function actor(e,actor)		{ return e.inEpisode(actor) }

function printer(array,func, arg) {
	array.forEach(function(e){
		if (func(e,arg)){
			e.print();
		}
	})
} 
