module Imdb
	attr_accessor :poster
  class Movie < Base
  	def initialize (imdb_id, title = nil)
  		super
  		@poster = poster
  	end
  end # Movie
end # Imdb