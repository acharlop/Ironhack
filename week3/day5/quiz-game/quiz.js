var fs = require('fs')
var prompt = require("prompt")
var Question = require("./question.js")

var Quiz = function() {
  this.idx = 0
  this.questions = new Array()
}
Quiz.prototype.last = function(){ 
  return this.idx === this.questions.length
}
Quiz.prototype.next = function(){
  return this.questions[this.idx++]
}
Quiz.prototype.begin = function(){
   if (!this.last()) {
      q = this.next()
      this.begin()
   }
}
Quiz.prototype.load = function(file){
  var self = this
  fs.readFile(file, 'utf8', function(err,file) {
    if(err) {
      throw err
    }
    JSON.parse(file).forEach( function(e ) {
      self.questions.push(new Question(e))
    })
    self.begin()
  })
}

var my_quiz = new Quiz()
my_quiz.load("./questions.json")


var answer = function() {
    
}
var schema = {
	properties: {
		answer: {
			description: "q.question",
			type: "string",
			message: "Try to answer, you must young padawan",
			required: true
		}
	}
}

//   prompt.start();

//   prompt.get(schema, function (err, result) {
//     if (err) { return onErr(err); }
//     else if(result.answer == q.answer)
//     	console.log("yay")
//     else
//     	console.log("whats wrong with you?")
//   });

//   function onErr(err) {
//     console.log(err);
//     return 1;
//   }