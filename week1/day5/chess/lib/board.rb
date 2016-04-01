require_relative "print_module"

class Board
	include Printer
	def initialize
		@board = create_board
	end
	def create_board
		bored = {}
		("a".."h").each do |letr|
			(1..8).each do |numbr|
				bored[(letr + numbr.to_s).to_sym] = nil
			end
		end
		bored
	end
	def has_piece?(a1)
		@board[a1].nil? ? false : true
	end
	def to_rc(a1)
		vals = [nil,"a","b","c","d","e","f","g","h"]
		return vals.index(a1[0]), a1[1].to_i
	end
	def to_a1(r,c)
		vals = [nil,"a","b","c","d","e","f","g","h"]
		(vals[r] + c.to_s).to_sym
	end
	def on_board?(a1)
		@board.has_key?(a1)
	end
end