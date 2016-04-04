require_relative "../lib/fizz_buzz.rb"

RSpec.describe "Fizz Buzz" do
	let(:fizz_buzz) {FizzBuzz.new}

	specify "Returns 1 for the number 1" do
		input = 1
		output = "1"
		expect(fizz_buzz.to_s(input)).to eq(output)
	end
	
	specify "Returns Fizz for the number 3" do
		input = 3
		output = "Fizz"
		expect(fizz_buzz.to_s(input)).to eq(output)
	end

	specify "Returns Buzz for the number 5" do
		input = 5
		output = "Buzz"
		expect(fizz_buzz.to_s(input)).to eq(output)
	end

	specify "Returns FizzBuzz for the number 15" do
		input = 15
		output = "FizzBuzz"
		expect(fizz_buzz.to_s(input)).to eq(output)
	end
end