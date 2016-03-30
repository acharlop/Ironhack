require_relative 'lib/car.rb'
require_relative 'lib/car_dealer.rb'


cars = [
Car.new("Ford","Mustang"),
Car.new("Ford","F150"),
Car.new("Ford","Torus"),
Car.new("Honda","Civic"),
Car.new("Honda","NSX")
]

my_dealership = CarDealer.new(cars)

my_dealership.print_inventory