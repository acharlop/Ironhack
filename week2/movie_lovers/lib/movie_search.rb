require "imdb"
# require_relative "imdb_movie.rb"
class MovieSearch
	attr_reader :list, :type
	def initialize(search,type)
		@search = Imdb::Search.new(search).movies
		@list = []
		@type = type
		build_list
	end
	def build_list
		@search[0..8].each do | movie|
			poster = movie.poster
			if poster
				game_keys = self.send(@type, movie)
				@list.push({
					:poster=>poster,
					game_keys[0] => game_keys[1]
				})
			end
		end
	end
	def year(movie)
		[:year, movie.year]
	end
end