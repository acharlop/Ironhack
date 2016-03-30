require 'require_all'
require_all 'lib'


cars = [
Car.new("Ford","Mustang"),
Car.new("Ford","F150"),
Car.new("Ford","Torus"),
Car.new("Honda","Civic"),
Car.new("Honda","NSX")
]

my_dealership = CarDealer.new(cars)

# my_dealership.print_inventory

my_vehicles = VehicleObserver.new([
	Motorcycle.new,
	Helicopter.new,
	RacingCar.new])

puts my_vehicles.wheel_counter
my_vehicles.rev_em_up