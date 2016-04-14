var Car = function (model, noise) {
	this.model = model
	this.noise = noise
	this.wheel = 4	
}

Car.prototype.rev = function(){
	 return this.noise
}

var civic = new Car("civic","vroom")
console.log(civic.rev)