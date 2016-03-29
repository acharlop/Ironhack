class Car
	def initialize(make, model, seats, sound)
		@make = make
		@model = model
		@seats = seats
		@sound = sound
		@miles = 0
	end
	def rev
		puts @sound
	end
end