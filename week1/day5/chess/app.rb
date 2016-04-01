require "require_all"
require_all "lib"

game = Board.new
game.print_board
puts game.has_piece?("a1").to_s
row, col = game.to_rc("h8")
puts row.to_s
puts col.to_s
puts game.to_a1(3,3)
puts game.on_board?(:a1).to_s
puts game.on_board?(:h9).to_s
puts game.on_board?(:j1).to_s










# wr_left = Rook.new(1,1,:white)
# bk = King.new(2,2,:black)
# bish = Bishop.new(5,5,:black)
# knt = Knight.new(4,4,:black)
# qn = Queen.new(5,5,:white)
# puts "Rook tests"
# puts "validate no move: " << wr_left.move?(1,1).to_s
# puts "validate h1: " << wr_left.move?(1,8).to_s
# puts "validate a8: " << wr_left.move?(8,1).to_s
# puts "validate b2: " << wr_left.move?(2,2).to_s
# puts "validate h8: " << wr_left.move?(8,8).to_s
# puts 
# puts
# puts "king test"
# puts "validate no move: " << bk.move?(2,2).to_s
# puts "validate diag a1: " << bk.move?(1,1).to_s
# puts "validate diag a3: " << bk.move?(1,3).to_s
# puts "validate diag c3: " << bk.move?(3,3).to_s
# puts "validate diag c1: " << bk.move?(3,1).to_s
# puts "validate b3: " << bk.move?(4,3).to_s
# puts "validate b3: " << bk.move?(2,4).to_s
# puts "validate b3: " << bk.move?(5,5).to_s
# puts "validate b3: " << bk.move?(1,0).to_s
# puts 
# puts
# puts "bishop test"
# puts "validate no move: " << bish.move?(5,5).to_s
# puts "validate : " << bish.move?(1,1).to_s
# puts "validate : " << bish.move?(2,2).to_s
# puts "validate : " << bish.move?(8,2).to_s
# puts "validate : " << bish.move?(3,7).to_s
# puts "validate : " << bish.move?(5,6).to_s
# puts "validate : " << bish.move?(6,5).to_s
# puts "validate : " << bish.move?(8,7).to_s
# puts 
# puts
# puts "knight test"
# puts "validate no move: " << knt.move?(4,4).to_s
# puts "validate : " << knt.move?(3,2).to_s
# puts "validate : " << knt.move?(5,2).to_s
# puts "validate : " << knt.move?(6,3).to_s
# puts "validate : " << knt.move?(6,5).to_s
# puts "validate : " << knt.move?(4,5).to_s
# puts "validate : " << knt.move?(8,8).to_s
# puts 
# puts
# puts "queen test"
# puts "validate no move: " << qn.move?(5,5).to_s
# puts "validate : " << qn.move?(1,1).to_s
# puts "validate : " << qn.move?(2,2).to_s
# puts "validate : " << qn.move?(8,2).to_s
# puts "validate : " << qn.move?(3,7).to_s
# puts "validate : " << qn.move?(5,6).to_s
# puts "validate : " << qn.move?(6,5).to_s
# puts "validate : " << qn.move?(8,7).to_s
# bp = Pawn.new(7,2,:black)
# wp = Pawn.new(2,2,:black)
# puts
# puts
# puts "black pawn test"
# puts "validate no move bp " << bp.move?(7,2).to_s
# puts "validate bp " << bp.move?(5,2).to_s
# puts "validate bp " << bp.move?(3,2).to_s
# puts "validate bp " << bp.move?(7,3).to_s
# puts "white pawn test"
# puts "validate no move wp " << wp.move?(2,2).to_s
# puts "validate wp " << wp.move?(4,2).to_s
# puts "validate wp " << wp.move?(6,2).to_s
# puts "validate wp " << wp.move?(2,3).to_s

