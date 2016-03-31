class Game
	attr_accessor :game_over
	attr_reader :current_room
	def initialize(rooms)
		@rooms = rooms
		@game_over = false
		@current_room = ""
		@actions = {}
	end
	def start_game(room)
		@current_room = @rooms[room]
	end
	def end_game
		@game_over = true
	end
	def game_over?
		@game_over
	end
	def get_prompt
		prompt = ""
		prompt << @current_room.description << "\n"
		prompt << @current_room.get_action_prompts
		prompt << "\nExits: " << @current_room.get_dirs << " > "
		print prompt
	end
	def error
		@current_room.error
	end
	def act(action)
		perform_action = @current_room.has_act(action)
		if perform_action
			if perform_action.game_over
				end_game
			end
			perform_action.perform
			true
		else
			false
		end
	end
	def move_to(dir)
		new_room = @current_room.move(dir)
		if new_room 
			@current_room = @rooms[new_room]
		else
			false
		end
	end
end