require_relative "print_module"

class Board
	include Printer
	def initialize
		@board = YAML.load_file("lib/new_game.yml")
	end
	def get_piece(a1)
		@board[a1].nil? ? false : @board[a1]
	end
	def to_rc(a1)
		vals = [nil,"a","b","c","d","e","f","g","h"]
		return a1.to_s[1].to_i, vals.index(a1.to_s[0])
	end
	def to_key(r,c)
		vals = [nil,"a","b","c","d","e","f","g","h"]
		(vals[r] + c.to_s).to_sym
	end
	def on_board?(a1)
		@board.has_key?(a1)
	end
	def move(start_c,end_c)
		r,c = to_rc(end_c)
		piece = get_piece(start_c)
		if !piece
			puts start_c.to_s << " isn't a valid piece " << piece.to_s
			return false
		end
		if !on_board?(end_c)
			puts end_c.to_s << " isn't on the board"
			return false
		end
		if !piece.move?(r,c)
			puts " illegal move"
			return false
		end
		
		@board[end_c] = piece
		piece.move(r,c)
		@board[start_c] = nil
		true
	end
end