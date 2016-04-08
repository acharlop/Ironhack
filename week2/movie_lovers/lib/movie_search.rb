require "imdb"
# require_relative "imdb_movie.rb"
class MovieSearch
	attr_reader :list
	def initialize(search,type)
		@search = Imdb::Search.new(search).movies
		@list = []
		@type = type
		build_list
	end
	def build_list
		@search[0..9].each do | movie|
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
		[:release_date, (movie.title[/\(([0-9]{4})\)$/,1].to_i)]
	end
end