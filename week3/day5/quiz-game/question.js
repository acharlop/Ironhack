var question = function (question,answer) {
	this.id = id()
	this.question = question
	this.answer = answer
}

var id = function(){
	return ++next_id
}
var next_id = 0

module.exports = question