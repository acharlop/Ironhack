module MoviePrompts
	def year_prompt(movie)
		@prompt << "Which film "
		if movie[@type] >= Time.now.year
			@prompt << "will be "
		else
			@prompt << "was "
		end
		@prompt << "released in " << movie[@type].to_s << "?"
	end
	def length_prompt(movie)
		@prompt << "Which film is " << movie[@type] << " minutes long?"
	end
	def rating_prompt(movie)
		@prompt << "Which film has an IMDB rating of " << movie[@type] << " out of 10?"
	end
	def company_prompt(movie)
		@prompt << "Which film was made by " << movie[@type] << "?"
	end
	def actor_prompt(movie)
		@prompt << "In which film did " << movie[@type] << " act?"
	end
	def character_prompt(movie)
		@prompt << "Which film had the character " << movie[@type] << " in it?"
	end
	def character_match_prompt(movie)
		@prompt << "In which film did " << movie[@type] << "?"
	end 
	def actor_hard_prompt(movie)
		@prompt << "In which film did " << movie[@type] << " act?"
	end
	def character_hard_prompt(movie)
		@prompt << "Which film had the character " << movie[@type] << " in it?"
	end
	def character_match_hard_prompt(movie)
		@prompt << "In which film did " << movie[@type] << "?"
	end
	def tagline_prompt(movie)
		@prompt << "Which movie\'s tagline is:\n" << movie[@type] << "?"
	end
	def directors_prompt(movie)
		@prompt << "Which movie was directed by " << movie[@type] << "?"
	end
	def release_date_prompt(movie)
		@prompt << "Which film "
		if movie[@type].split(" ")[2].to_i >= Time.now.year
			@prompt << "will be "
		else
			@prompt << "was "
		end
		@prompt << "released on " << movie[@type].to_s << "?"
	end
	def genres_prompt(movie)
		@prompt << "Which movie has the generes of " << movie[@type] << "?"
	end
	def writers_prompt(movie)
		@prompt << "Which movie was written by " << movie[@type] << "?"
	end
	def title_hard_prompt(movie)
		@prompt << "Which movie is also known as " << movie[@type] << "?"
	end
end