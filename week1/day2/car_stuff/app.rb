# PULL IN CLASSES
require_relative "lib/car.rb"

nis = Car.new("Nissan","350Z",2,"BROOOOOOM")

puts "Starting road trip! Que bad music"
loop do
	print "What city are we going to next? "
	city = gets.chomp
	break if city.downcase == "home"
	nis.visit_city(city.capitalize)
end

puts 
puts "Wow what a trip! Lets see where we went"
nis.view_visited_cities
