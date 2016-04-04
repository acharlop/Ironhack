class Person
	def initialize(name)
		@name = name
		@working = []
		@endorses = []
	end
	def endorse(movie)
		@endorses.push(movie)
	end
end