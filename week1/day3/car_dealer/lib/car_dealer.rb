class CarDealer
	def initialize(inventory)
		@inventory = Hash.new{[].freeze}
		inventory.each {|car| add_car(car)}
	end
	def add_car(car)
		@inventory[car.make] += [car.model]
	end
	def print_inventory
		@inventory.each {|make, models| puts "#{make}: #{models.join(", ")}" }
	end
end