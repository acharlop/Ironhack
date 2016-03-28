class Home
	attr_reader(:name, :city, :capacity, :price)

	def initialize(name,city,capacity,price)
		@name = name
		@city = city
		@capacity = capacity
		@price = price
	end
end

homes = [
	Home.new("Nizar", 	"San Juan", 	2, 42),
  Home.new("Fernando","Seville", 		5, 47),
  Home.new("Josh", 		"Pittsburgh", 3, 41),
  Home.new("Gonzalo", "Málaga", 		2, 45),
  Home.new("Ariel", 	"San Juan", 	4, 49),
  Home.new("Avi",			"Miami",			4, 55),
  Home.new("Sarah",		"New York",		1, 65),
  Home.new("Mark",		"Dallas",			8, 80),
  Home.new("Ryan",		"New York",		6, 40),
  Home.new("Bianca",	"Miami",			2, 37)
]

def print_homes(array)
	array.each_with_index do |hm,idx|
		puts "Home number #{idx+1}"
		puts "#{hm.name}\'s place in #{hm.city}"
		puts "Price: $#{hm.price} a night"
		puts "Capacity: max of #{hm.capacity} people"
		puts
	end
end	
system "clear"
puts "Welcome to TxtBnb! We have a total of #{homes.length} options for you to stay!"
print "Average capacity: "
puts homes.reduce(0.0){|sum,hm| sum + hm.capacity}  / homes.length
print "Average cost: "
puts homes.reduce(0.0){|sum,hm| sum + hm.price}  / homes.length
puts "Press ENTER to continue"
gets
# 
while homes.length != 1
	system "clear"
	print_homes(homes)
	puts "Enter the listing number"
	puts "Or to start sorting enter \'city\' or \'price\'"
	sort_type = gets.chomp
	if sort_type.downcase == "city"
		puts "Enter the city you would like to stay in:"
		city = gets.chomp
		homes.select!{|hm| hm.city.downcase == city.downcase}
	elsif sort_type.downcase == "price"
		puts "Enter the max price you would like to pay:"
		price = gets.chomp
		homes.select!{|hm| hm.price <= price.to_i}
	elsif sort_type.to_i.between?(0, homes.length)
		homes = [homes.at(sort_type.to_i-1)]
	end
end

system "clear"
puts "Congrats on finding your bed for the night!"
puts "You will be staying at #{homes[0].name}\'s place in #{homes[0].city}"
puts "For the grand total of $#{homes[0].price}"
puts "and can bring up to #{homes[0].capacity} awesome friends! I hope you\'ll bring me!"