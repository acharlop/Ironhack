
class WordChain
	def initialize(dictionary)
		@dict = Dictionary.from_file(dictionary)
		@start_word = ""
		@end_word = ""
	end

	def find_chain(start_word,end_word)
		if start_word.length != end_word.length
			puts "Words need to be of equal length"
			return
		end
		@start_word = start_word.dup
		puts @start_word
		@end_word = end_word
		start = start_word.dup

		@start_word.length.times do
			start = try_word(start,0)
			if start == @end_word
				return
			end
		end
	end

	def try_word(start,i)
		if i >= @end_word.length
			start
		else
			test = start.dup
			test[i] = @end_word[i]
			if @dict.exists?(test) && @end_word[i] != start[i]
				start = test
				puts start
			end
			try_word(start,i += 1)
		end
		
	end

end