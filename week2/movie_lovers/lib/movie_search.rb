require "imdb"
require_relative "helpers.rb"
# require_relative "imdb_movie.rb"
class MovieSearch
	include MovieSearchHelpers
	attr_reader :list, :type
	def initialize(search,type)
		@search = Imdb::Search.new(search).movies
		@list = []
		@type = type
		build_list
	end
	# def build_list
	# 	@search[0..8].each do | movie|
	# 		poster = movie.poster
	# 		if poster
	# 			game_keys = self.send(@type, movie)
	# 			@list.push({
	# 				:poster=>poster,
	# 				game_keys[0] => game_keys[1]
	# 			})
	# 		end
	# 	end
	# end
	def build_list
		@search[0..8].each do | movie|
			add_to_list(movie)
		end
	end
	def add_to_list(movie)
		poster = movie.poster
		return unless poster
		key = self.send(@type, movie)
		@list.push({:poster=>poster, key[0] => key[1]})
	end
	def year(movie)
		[:year, movie.year]
	end
end