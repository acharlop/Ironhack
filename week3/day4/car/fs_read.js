var fs = require("fs")

function print(error, content) {
	if (error) {
		console.log("oh no! error! ",error)
	} else {
		console.log("Success", content)
	}
}

fs.readFile("file-not-there.txt","utf8", print)