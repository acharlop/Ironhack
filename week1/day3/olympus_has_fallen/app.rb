require "require_all"
require_all "lib"

system "clear"
puts "Enter x to exit at any time"

room = all_rooms.fetch("oval")
room.enter

while room
	print "Exits: #{room.get_dirs} > "
	move = gets.chomp[0].downcase
	if move == "x"
		puts "Thanks for playing"
		room = false
	else
		next_room = room.move(move)
		if next_room
			room = all_rooms.fetch(next_room)
			room.enter
		end
	end
end
