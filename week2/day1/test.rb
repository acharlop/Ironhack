require_relative "lib/string_calculator.rb"
calc = StringCalculator.new

puts calc.add("7,6,5,2") == 20
puts calc.add("70,60,50,200,1") == 381

puts calc.add("7,6") == 13
puts calc.add("9,1") == 10

puts calc.add("5") == 5
puts calc.add("3") == 3

puts calc.add("") == 0
