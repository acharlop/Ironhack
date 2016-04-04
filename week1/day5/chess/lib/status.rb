class GameError
	def initialize
		@status = false
		@errors = []
	end
	def add(err)
		@status = true
		@errors.push(err)
	end
	def err?
		@status
	end
	def print
		@errors.each{|e| puts e}
	end
end
