require "require_all"
require "ruby-dictionary"

require_all "lib"

my_chain = WordChain.new("/usr/share/dict/words")

while true
	print "word1: "
	word_one = gets.chomp
	if word_one == "exit now"
		break
	end
	print "word2: "
	word_two = gets.chomp
	my_chain.find_chain(word_one,word_two)
end