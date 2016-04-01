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