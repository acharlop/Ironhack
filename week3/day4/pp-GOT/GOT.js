var fs = require('fs')
var doCoolShit = require("./cool_stuff.js")

function fileActions(err, file){ 
    if (err) {
        throw err
    }
    doCoolShit(JSON.parse(file))
}

fs.readFile("./GoTEpisodes.json", 'utf8', fileActions)

