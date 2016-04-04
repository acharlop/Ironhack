class Lexiconomitron
	def eat_t(word)
		word.gsub(/[tT]/,"")
	end
	def shazam(arr)
		new_arr = arr.map{|word| eat_t(word.reverse)}
		[new_arr.first, new_arr.last]
	end
	def oompa(arr)
		new_arr = arr.collect{|l| eat_t(l)}
		new_arr.select!{|word| word.length <= 3}
	end
end