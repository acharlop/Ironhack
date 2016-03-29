class Car
	def initialize(make, model, seats, sound)
		@make = make
		@model = model
		@seats = seats
		@sound = sound
		@miles = 0
		@cities = []
	end
	def rev
		puts @sound
	end
	def visit_city(city)
		@cities.push(city)
		puts "Now visiting #{city}"
	end
	def view_visited_cities
		puts "This car has been to #{@cities.join(", ")}"
	end
end