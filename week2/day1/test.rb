require 'RSpec'
require_relative "lib/string_calculator.rb"


RSpec.describe "String calculator" do
	before :each do
	@calc = StringCalculator.new
end
	specify "Returns 0 for the empty string" do
		input = ""
		output = 0
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 3 for only that number" do
		input = "3"
		output = 3
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 5 for only that number" do
		input = "5"
		output = 5
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 13 for two numbers" do
		input = "7,6"
		output = 13
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 10 for two numbers" do
		input = "9,1"
		output = 10
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 20 for 4 numbers" do
		input = "7,6,5,2"
		output = 20
		expect(@calc.add(input)).to eq(output)
	end

	it "Returns 381 for 5 numbers" do
		input = "70,60,50,200,1"
		output = 381
		expect(@calc.add(input)).to eq(output)
	end
end

