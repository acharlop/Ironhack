require "require_all"
require "yaml"
require_all "lib"

game = GamePlay.new

game.play

# game = Board.new
# p game.get_piece(:a1)




# puts game.has_piece?("a1").to_s
# row, col = game.to_rc("h8")
# puts row.to_s
# puts col.to_s
# puts game.to_a1(3,3)
# puts game.on_board?(:a1).to_s
# puts game.on_board?(:h9).to_s
# puts game.on_board?(:j1).to_s



# tmp = {:a1=>Rook.new(1,1,:white),
# :b1=>Knight.new(1,2,:white),
# :c1=>Bishop.new(1,3,:white),
# :d1=>Queen.new(1,4,:white),
# :e1=>King.new(1,5,:white),
# :f1=>Bishop.new(1,6,:white),
# :g1=>Knight.new(1,7,:white),
# :h1=>Rook.new(1,8,:white),
# :a2=>Pawn.new(2,1,:white),
# :b2=>Pawn.new(2,2,:white),
# :c2=>Pawn.new(2,3,:white),
# :d2=>Pawn.new(2,8,:white),
# :e2=>Pawn.new(2,4,:white),
# :f2=>Pawn.new(2,5,:white),
# :g2=>Pawn.new(2,6,:white),
# :h2=>Pawn.new(2,7,:white),
# :a3=>nil,
# :b3=>nil,
# :c3=>nil,
# :d3=>nil,
# :e3=>nil,
# :f3=>nil,
# :g3=>nil,
# :h3=>nil,
# :a4=>nil,
# :b4=>nil,
# :c4=>nil,
# :d4=>nil,
# :e4=>nil,
# :f4=>nil,
# :g4=>nil,
# :h4=>nil,
# :a5=>nil,
# :b5=>nil,
# :c5=>nil,
# :d5=>nil,
# :e5=>nil,
# :f5=>nil,
# :g5=>nil,
# :h5=>nil,
# :a6=>nil,
# :b6=>nil,
# :c6=>nil,
# :d6=>nil,
# :e6=>nil,
# :f6=>nil,
# :g6=>nil,
# :h6=>nil,
# :a7=>Pawn.new(7,1,:black),
# :b7=>Pawn.new(7,2,:black),
# :c7=>Pawn.new(7,3,:black),
# :d7=>Pawn.new(7,4,:black),
# :e7=>Pawn.new(7,5,:black),
# :f7=>Pawn.new(7,6,:black),
# :g7=>Pawn.new(7,7,:black),
# :h7=>Pawn.new(7,8,:black),
# :a8=>Rook.new(8,1,:black),
# :b8=>Knight.new(8,2,:black),
# :c8=>Bishop.new(8,3,:black),
# :d8=>Queen.new(8,4,:black),
# :e8=>King.new(8,5,:black),
# :f8=>Bishop.new(8,6,:black),
# :g8=>Knight.new(8,7,:black),
# :h8=>Rook.new(8,8,:black)}

# File.open('lib/new_game.yml','w') do |out|
# 	YAML.dump(tmp,out)
# end




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
# puts wp.name
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

