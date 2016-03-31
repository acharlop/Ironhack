require "require_all"
require_all "lib"

all_rooms = {
	"oval" 				=>	Room.new("Yellow Oval Room"				,"Of the important decissions made in the room, that was not one of them"								,{"n"=>"cent_hall_e","s"=>"balcony","e"=>"treaty"}),
	"cent_hall_e" => 	Room.new("Center Hall East"				,"If you got here you must be repenting for a past life"																,{"n"=>"hall_north","s"=>"oval","e"=>"grand_stair","w"=>"cent_hall_w"}),
	"cent_hall_w" => 	Room.new("Center Hall West"				,"Good thinking running into the 1 wall in a massive hall"															,{"s"=>"sit_priv"		,"e"=>"cent_hall_e","w"=>"sitting_w"}),
	"balcony" 		=> 	Room.new("Truman Balcony"					,"50 cal shells rip through the concrete around you"																		,{"n"=>"oval"}),
	"kitchen"			=> 	Room.new("Kitchen"								,"Just time for a quick bite before getting back to saving the world"										,{"e"=>"dining"}),
	"dressing"		=> 	Room.new("Dressing Room"					,"With only one exit you better hope they don't walk through that door"									,{"e"=>"pres_bed"}),
	"dining"			=> 	Room.new("Presidents Dining Room"	,"The feasts held here..."																															,{"s"=>"sitting_w","w"=>"kitchen"}),
	"pres_bed"		=> 	Room.new("Presidents Bedroom"			,"When he snoozes the whole world looses, hey you guys have something in common! Come on get back in the fight"								,{"n"=>"sitting_w","e"=>"sit_priv","w"=>"dressing"}),
	"sitting_w"		=> 	Room.new("West Sitting Hall"			,"Just sitting for a second...OH I get it sitting room. NOT FUNNY"											,{"n"=>"dining","s"=>"pres_bed","e"=>"cent_hall_w"}),
	"sit_priv"		=> 	Room.new("Private Sitting Room"		,"You are stuck where Monica L su... woops forgot keeping it PG for now"								,{"n"=>"cent_hall_w","w"=>"pres_bed"}),
	"west"				=> 	Room.new("West Room"							,"Wonder why they couldn't come up for a better name for the place your going to die in",{"e"=>"hall_north"}),
	"east"				=> 	Room.new("East Room"							,"East and West rooms? Hey at least they are consistent in this hall. Unlike anywhere else in the building or country"								,{"w"=>"hall_north"}),
	"treaty"			=> 	Room.new("Treaty Room"						,"There are still some more bad treaties to be made! If you find your way out you can help get that road on the show!"								,{"w"=>"oval"}),
	"grand_stair"	=> 	Room.new("Grand Stairs"						,"Is this the stairway to heaven?"																											,{"e"=>"sitting_e","w"=>"cent_hall_e"}),
	"sitting_e"		=> 	Room.new("East Sitting Hall"			,"Waiting around for...?"																																,{"n"=>"queens_bed","s"=>"lincoln_bed","w"=>"grand_stair"}),
	"lincoln_bed" => 	Room.new("Lincoln Bedroom"				,"Time for a quick snooze, hey Mr. Abe hows the air up there?"													,{"n"=>"sitting_e","e"=>"sit_linc"}),
	"queens_bed"	=> 	Room.new("Queens Bedroom"					,"Wonder which lucky queen got this room. Or was it a nickname for a past president? Remind me to look that up later"								,{"s"=>"sitting_e","e"=>"sit_queen"}),
	"sit_queen"		=> 	Room.new("Queen's Sitting Room"		,"Are there any two that say laziness more then sitting and queen?"											,{"w"=>"queens_bed"}),
	"sit_linc"		=> 	Room.new("Lincoln Sitting Room"		,"Now there's a hard working chap who needs to take a load off"													,{"w"=>"lincoln_bed"}),
	"hall_north"	=> 	Room.new("North Hall"							,"It's not cold in here? Ohhhh we're in the North \"Hall\". Never mind"									,{"s"=>"cent_hall_e","e"=>"east","w"=>"west"}),
}


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
