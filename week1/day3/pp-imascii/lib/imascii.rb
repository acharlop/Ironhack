class ImAscii
	attr_accessor :movie_list
	def initialize(array)
		@movie_list = array.collect{|movie| Movie.new(movie)}
	end

	def print_movies
		@movie_list.each_with_index do |movie, idx|
			puts "#{(idx+1)} - #{movie.title}"
		end
	end

	def print_rating
		display = ""

		10.downto(1) do |rating|
			display << "|"
			display << @movie_list.collect { |movie| 
				movie.rating >= rating ? "*" : " "
			}.join("|")
			display << "|\n"
		end
		display << "-" * @movie_list.length * 2 << "-\n|"
		display << 1.upto(@movie_list.length).collect{|num|num}.join("|")
		display << "|\n\n"

		puts display
	end
end