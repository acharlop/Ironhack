
class WordChain
	def initialize(dictionary)
		@dict = Dictionary.from_file(dictionary)
	end

	def find_chain(start_word,end_word)
		if start_word.length != end_word.length
			return
		end
		count = 0
		j = 0
		puts start_word

		while start_word != end_word
			if count >= start_word.length ** start_word.length
				j += 1
				count = 0
			end
			i=j

			while i < start_word.length
				start_test = start_word.dup
				start_test[i] = end_word[i]
				if @dict.exists?(start_test) && end_word[i] != start_word[i]
					start_word = start_test
					puts start_word
				end
				i += 1
				count += 1
			end

		end
	

	end


end