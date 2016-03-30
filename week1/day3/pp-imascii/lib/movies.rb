class Movie
	attr_reader :title, :rating
	def initialize(movie)
		i = Imdb::Search.new(movie)
		info = i.movies[0]

		@title = info.title
		@rating = info.rating
	end
end