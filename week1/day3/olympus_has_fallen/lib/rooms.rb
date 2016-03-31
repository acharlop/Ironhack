class Room
	attr_reader :description, :error
	def initialize(description, error, directions, actions)
		@directions = directions
		@description = description
		@error = error
		@actions = actions
	end
	def move(dir)
		if @directions[dir]
			@directions[dir]
	 	else
	 		false
	 	end
	end
	def has_act(action)
		if @actions[action]
			@actions[action]
		else
			false
		end
	end
	def get_dirs
		@directions.keys.join(", ")
	end
	def get_action_prompts
		@actions.collect{|k,act| act.prompt}.join("\n")
	end
	def get_actions
		@actions.collect{|k,act| act.action}
	end
end