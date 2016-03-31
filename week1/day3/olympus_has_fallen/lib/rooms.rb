class Room
	attr_reader :description, :error
	def initialize(description, error, directions)
		@directions = directions
		@description = description
		@error = error
	end
	def enter
		puts @description
	end
	def move(dir)
		if @directions[dir]
			return @directions[dir]
	 	else
	 		puts @error
	 	end
 		false
	end
	def get_dirs
		@directions.keys.join(", ")
	end

end