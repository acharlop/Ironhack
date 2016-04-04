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
	def blocked(sr,sc,er,ec)
		piece = get_piece(to_key(sr,sc))
		if (sr == er && sc == ec) || piece
			puts "working ok"
			return sr, sc, piece
		else
			if sr == er
				puts "horiz"
				blocked(sr,calc_next(sc,ec),er,ec)
			elsif sc == ec
				puts "vert"
				blocked(calc_next(sr,er),sc,er,ec)
			else
				puts "doooh"
				sr,sc = diagonal(sr,sc,er,ec)
				blocked(sr,sc,er,ec)
			end
		end
	end
	def calc_next(s,e)
		s > e ? s - 1 : s + 1
	end
	def diagonal(sr,sc,er,ec)
		return calc_next(sr,er), calc_next(sc,ec)
	end
	def move(start_c,end_c)
		err = GameError.new
		r,c = to_rc(start_c)
		nr, nc = to_rc(end_c)
		piece = get_piece(start_c)
		new_c = get_piece(end_c)
		# end_c = to_key(nr,nc)
		p piece
		if !piece
			err.add("No piece at coordinates " << start_c.to_s )
			return 
		end
		if !on_board?(end_c)
			err.add(end_c.to_s << " is not on the board")
		end
		if !piece.move?(nr,nc)
			err.add("That is not a valid move for a " << piece.class.to_s )
		end
		if new_c && piece.teamate?(new_c)
			err.add("You already have a " << new_c.class.to_s << " on " << end_c.to_s ) 
		end

		if piece.class != Knight
			puts "here"
			# tr, tc, block = blocked(r,c,tr,tc)
			# puts blocked(r,c,tr,tc)
		# 	if block && piece.teamate?(block)
		# 		err.add("Your path is blocked by a teamate at " << to_key(tr,tc).to_s )
		# 	end
		end
		if !err.err?
			@board[end_c] = piece
			piece.move(nr,nc)
			@board[start_c] = nil
		end
		err
	end
end