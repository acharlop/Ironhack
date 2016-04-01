require "require_all"
require_all "lib"

wr_left = Rook.new(1,1,:white)
bk = King.new(2,2,:black)
bish = Bishop.new(5,5,:black)
puts "Rook tests"
puts "validate no move: " << wr_left.move?(1,1).to_s
puts "validate h1: " << wr_left.move?(1,8).to_s
puts "validate a8: " << wr_left.move?(8,1).to_s
puts "validate b2: " << wr_left.move?(2,2).to_s
puts "validate h8: " << wr_left.move?(8,8).to_s
puts 
puts
puts "king test"
puts "validate no move: " << bk.move?(2,2).to_s
puts "validate diag a1: " << bk.move?(1,1).to_s
puts "validate diag a3: " << bk.move?(1,3).to_s
puts "validate diag c3: " << bk.move?(3,3).to_s
puts "validate diag c1: " << bk.move?(3,1).to_s
puts "validate b3: " << bk.move?(4,3).to_s
puts "validate b3: " << bk.move?(2,4).to_s
puts "validate b3: " << bk.move?(5,5).to_s
puts "validate b3: " << bk.move?(1,0).to_s
puts 
puts
puts "bishop test"
puts "validate no move: " << bish.move?(5,5).to_s
puts "validate : " << bish.move?(1,1).to_s
puts "validate : " << bish.move?(2,2).to_s
puts "validate : " << bish.move?(8,2).to_s
puts "validate : " << bish.move?(3,7).to_s
puts "validate : " << bish.move?(5,6).to_s
puts "validate : " << bish.move?(6,5).to_s
puts "validate : " << bish.move?(8,7).to_s
