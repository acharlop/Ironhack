var question = function (obj) {
	this.id = id()
	this.question = obj.question
	this.answer = obj.answer
}

var id = function(){
	return ++next_id
}
var next_id = 0

module.exports = question