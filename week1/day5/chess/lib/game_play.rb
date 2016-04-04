class GamePlay
	def initialize
		@game = Board.new
		@status = GameError.new
	end
	def play
		while true
			system "clear"
			@game.print_board
			puts "\n"
			if @status.err?
				@status.print
			end				
			print "Enter starting and destination cell (a1 a2): "
			input = gets.downcase.chomp.split(" ")
			if input[0] == "exit"
				break
			end
			@status = @game.move(input[0].to_sym, input[1].to_sym)
		end
	end
end