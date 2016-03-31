require "require_all"
require "yaml"
require_all "lib"

oval_err = "Of the important decissions made in the room, that was not one of them"
cent_hall_e_err = "If you got here you must be repenting for a past life"
cent_hall_w_err = "Good thinking running into the 1 wall in a massive hall"
balcony_err = "50 cal shells rip through the concrete around you"
kitchen_err = "Just time for a quick bite before getting back to saving the world"
dressing_err = "With only one exit you better hope they don't walk through that door"
dining_err = "Wow saving the world makes me hungry!"
pres_bed_err = "When he snoozes the whole world looses, hey you guys have something in common! Come on get back in the fight"
sitting_w_err = "Just sitting for a second...OH I get it sitting ina sitting room. NOT FUNNY"
sit_priv_err = "You are stuck where Monica L su... woops forgot there are kids here"
west_err = "Wondering why they couldn't come up for a better name for the place your going to die in?"
east_err = "East and West rooms? Hey at least they are consistent in this hall. Unlike anywhere else in the building or country"
treaty_err = "There are still some more bad treaties to be made! If you find your way out you can help get that road on the show!"
grand_stair_err = "Is this the stairway to heaven?"
sitting_e_err = "Waiting around for...?"	
lincoln_bed_err = "Time for a quick snooze, hey Mr. Abe hows the air up there?"
queens_bed_err = "Wonder which lucky queen got this room. Or was it a nickname for a past president? Remind me to look that up later"
sit_queen_err = "Are there any two that say laziness more then sitting and queen?"
sit_linc_err = "Now there's a hard working chap who needs to take a load off"
hall_north_err = "It's not cold in here? Ohhhh we're in the North \"Hall\". Never mind"

oval_desc = "Yellow Oval Room"
cent_hall_e_desc = "Center Hall East"
cent_hall_w_desc = "Center Hall West"
balcony_desc = "Truman Balcony"
kitchen_desc = "Kitchen"
dressing_desc = "Dressing Room"
dining_desc = "Presidents Dining Room"
pres_bed_desc = "Presidents Bedroom"
sitting_w_desc = "West Sitting Hall"
sit_priv_desc = "Private Sitting Room"
west_desc = "West Room"
east_desc = "East Room"
treaty_desc = "Treaty Room"
grand_stair_desc = "Grand Stairs"
sitting_e_desc = "East Sitting Hall"
lincoln_bed_desc = "Lincoln Bedroom"
queens_bed_desc = "Queens Bedroom"
sit_queen_desc = "Queen's Sitting Room"
sit_linc_desc = "Lincoln Sitting Room"
hall_north_desc = "North Hall"

oval_dirs = {"n"=>"cent_hall_e","s"=>"balcony","e"=>"treaty"}				
cent_hall_e_dirs = {"n"=>"hall_north","s"=>"oval","e"=>"grand_stair","w"=>"cent_hall_w"}	
cent_hall_w_dirs = {"s"=>"sit_priv"		,"e"=>"cent_hall_e","w"=>"sitting_w"}	
balcony_dirs = {"n"=>"oval"}			
kitchen_dirs = {"e"=>"dining"}			
dressing_dirs = {"e"=>"pres_bed"}		
dining_dirs = {"s"=>"sitting_w","w"=>"kitchen"}			
pres_bed_dirs = {"n"=>"sitting_w","e"=>"sit_priv","w"=>"dressing"}		
sitting_w_dirs = {"n"=>"dining","s"=>"pres_bed","e"=>"cent_hall_w"}		
sit_priv_dirs = {"n"=>"cent_hall_w","w"=>"pres_bed"}		
west_dirs = {"e"=>"hall_north"}				
east_dirs = {"w"=>"hall_north"}				
treaty_dirs = {"w"=>"oval"}			
grand_stair_dirs = {"e"=>"sitting_e","w"=>"cent_hall_e"}	
sitting_e_dirs = {"n"=>"queens_bed","s"=>"lincoln_bed","w"=>"grand_stair"}		
lincoln_bed_dirs = {"n"=>"sitting_e","e"=>"sit_linc"}	
queens_bed_dirs = {"s"=>"sitting_e","e"=>"sit_queen"}	
sit_queen_dirs = {"w"=>"queens_bed"}		
sit_linc_dirs = {"w"=>"lincoln_bed"}		
hall_north_dirs = {"s"=>"cent_hall_e","e"=>"east","w"=>"west"}	

oval_acts = {"look" => Action.new}
cent_hall_e_acts = {"look" => Action.new} 
cent_hall_w_acts = {"look" => Action.new}
balcony_acts = {"look" => Action.new(die: true, prompt: "Don't look around for long or you will get shot!", response: "I told you to move your ass!")}
kitchen_acts = {"look" => Action.new}
dressing_acts = {"look" => Action.new}
dining_acts = {"look" => Action.new}
pres_bed_acts = {"look" => Action.new}
sitting_w_acts = {"look" => Action.new}
sit_priv_acts = {"look" => Action.new}
west_acts = {"look" => Action.new}
east_acts = {"look" => Action.new}
treaty_acts = {"look" => Action.new}
grand_stair_acts = {"look" => Action.new}
sitting_e_acts = {"look" => Action.new}
lincoln_bed_acts = {"look" => Action.new}
queens_bed_acts = {"look" => Action.new}
sit_queen_acts = {"look" => Action.new}
sit_linc_acts = {"look" => Action.new}
hall_north_acts = {"look" => Action.new}

all_rooms = {
	"oval" 				=>	Room.new(oval_desc				,oval_err					,oval_dirs				,oval_acts				),
	"cent_hall_e" => 	Room.new(cent_hall_e_desc	,cent_hall_e_err	,cent_hall_e_dirs	,cent_hall_e_acts	),
	"cent_hall_w" => 	Room.new(cent_hall_w_desc	,cent_hall_w_err	,cent_hall_w_dirs	,cent_hall_w_acts	),
	"balcony" 		=> 	Room.new(balcony_desc			,balcony_err			,balcony_dirs			,balcony_acts			),
	"kitchen"			=> 	Room.new(kitchen_desc			,kitchen_err			,kitchen_dirs			,kitchen_acts			),
	"dressing"		=> 	Room.new(dressing_desc		,dressing_err			,dressing_dirs		,dressing_acts		),
	"dining"			=> 	Room.new(dining_desc			,dining_err				,dining_dirs			,dining_acts			),
	"pres_bed"		=> 	Room.new(pres_bed_desc		,pres_bed_err			,pres_bed_dirs		,pres_bed_acts		),
	"sitting_w"		=> 	Room.new(sitting_w_desc		,sitting_w_err		,sitting_w_dirs		,sitting_w_acts		),
	"sit_priv"		=> 	Room.new(sit_priv_desc		,sit_priv_err			,sit_priv_dirs		,sit_priv_acts		),
	"west"				=> 	Room.new(west_desc				,west_err				 	,west_dirs				,west_acts				),
	"east"				=> 	Room.new(east_desc				,east_err					,east_dirs				,east_acts				),
	"treaty"			=> 	Room.new(treaty_desc			,treaty_err				,treaty_dirs			,treaty_acts			),
	"grand_stair"	=> 	Room.new(grand_stair_desc	,grand_stair_err	,grand_stair_dirs	,grand_stair_acts	),
	"sitting_e"		=> 	Room.new(sitting_e_desc		,sitting_e_err		,sitting_e_dirs		,sitting_e_acts		),
	"lincoln_bed" => 	Room.new(lincoln_bed_desc	,lincoln_bed_err	,lincoln_bed_dirs	,lincoln_bed_acts	),
	"queens_bed"	=> 	Room.new(queens_bed_desc	,queens_bed_err		,queens_bed_dirs	,queens_bed_acts	),
	"sit_queen"		=> 	Room.new(sit_queen_desc		,sit_queen_err		,sit_queen_dirs		,sit_queen_acts		),
	"sit_linc"		=> 	Room.new(sit_linc_desc		,sit_linc_err			,sit_linc_dirs		,sit_linc_acts		),
	"hall_north"	=> 	Room.new(hall_north_desc	,hall_north_err		,hall_north_dirs	,hall_north_acts	)
}

# File.open('default.yml','w') do |out|
# 	YAML.dump(all_rooms, out)
# end

rooms = YAML.load_file("default.yml")
system "clear"
game = Game.new(rooms)
puts "Enter x to exit at any time"

game.start_game("oval")

while !game.game_over?
	puts "\n\n"
	game.get_prompt
	move = gets.chomp.downcase
	if move == "x"
		puts "Thanks for playing"
		game.game_over = true
	else
		if !game.move_to(move) && !game.act(move)
			puts game.error
		end
	end
end
