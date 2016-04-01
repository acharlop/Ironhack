class Piece
	def initialize(row,col,color)
		@row = row
		@col = col
		@color = color
	end
	def move?(n_row, n_col)
		if @row == n_row && @col == n_col
			false
		else
			true
		end
	end
end

class Rook < Piece
	def move?(n_row, n_col)
		if super && (@row == n_row || @col == n_col)
			true
		else
			false
		end
	end
end

class King < Piece
	def move?(n_row,n_col)
		if super && (n_row.between?(@row-1,@row+1) && n_col.between?(@col-1,@col+1))
			true
		else
			false
		end
	end
end

class Bishop < Piece
	def move?(n_row,n_col)
		if super && ((@row - n_row).abs == (@col - n_col).abs)
			true
		else
			false
		end
	end
end			

class Knight < Piece
	def move?(n_row,n_col)
		if super && ((@row - n_row).abs + (@col - n_col).abs == 3)
			true
		else
			false
		end
	end
end	

class Queen < Piece
	def move?(n_row,n_col)
		if super && (((@row - n_row).abs == (@col - n_col).abs) || (@row == n_row || @col == n_col))
			true
		else
			false
		end
	end
end

class Pawn < Piece
	def initialize(row,col,color)
		super
		@moved = false
	end
	def move?(n_row,n_col)
		if (super && !@moved) && (@col == n_col && (@row - n_row).abs.between?(1,2))
			@moved = true
			true
		elsif (super && @moved) && (@col == n_col && (@row - n_row).abs == 1)
			true
		else
			false
		end
	end
end

				



