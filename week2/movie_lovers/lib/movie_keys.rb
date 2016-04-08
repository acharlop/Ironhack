module MovieKeys
	def year(movie)
		return :year, movie.year
	end
	def length(movie)
		return :length, movie.length
	end
	def rating(movie)
		return :rating, movie.rating
	end
	def company(movie)
		return :company, movie.company
	end
	def actor(movie)
		return :actor, movie.cast_members[0..5].sample
	end
	def character(movie)
		return :character, movie.characters[0..5].sample
	end
	def character_match(movie)
		character = movie.cast_members_characters[0..5].sample.split(" => ")
		return :character, "#{character[0]} play #{character[1]}"
	end 
	def actor_hard(movie)
		return :actor, movie.cast_members.sample
	end
	def character_hard(movie)
		return :character, movie.characters.sample
	end
	def character_match_hard(movie)
		character = movie.cast_members_characters.sample.split(" => ")
		return :character, "#{character[0]} play #{character[1]}"
	end
	def tagline(movie)
		return :tagline, movie.tagline
	end
	def directors(movie)
		return :directors, movie.director.join(", ")
	end
	def release_date(movie)
		return :release_date, movie.release_date
	end
	def genres(movie)
		return :genres, movie.genres.join(", ")
	end
	def writers(movie)
		return :writers, movie.writers.join(", ")
	end
	def title_hard(movie)
		title = movie.also_known_as.select{|t| t[:title] != movie.title}
		return :title, title.sample[:title]
	end
end