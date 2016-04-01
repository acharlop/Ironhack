class Board
	def initialize
		@board = Array.new(8){Array.new(8)}
	end
	def print_board
		output = ""
		@board.each do |col|
			col.each do |cell|
				output << " " << cell ? cell : "--" << " "
			end
			output << "\n"
		end
		puts output
	end
end