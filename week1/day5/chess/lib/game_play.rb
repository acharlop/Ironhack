class GamePlay
	def initialize
		@game = Board.new
	end
	def play
		while true
			@game.print_board
			print "\nEnter starting cell and destination cell (a1 a2): "
			input = gets.downcase.chomp.split(" ")
			if input[0] == "exit"
				break
			end
			@game.move(input[0].to_sym, input[1].to_sym)
		end
	end

end