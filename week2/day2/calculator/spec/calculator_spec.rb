require_relative "../lib/calculator.rb"

RSpec.describe Calculator do
	let(:calc) {Calculator.new}
	
	it 'initialized with no answer' do
		expect(calc.answer).to be_nil
	end 
	it 'initialized with no error' do
		expect(calc.err).to be_nil
	end 

  describe '#addition' do
    it "addition numbers" do
    	calc.addition(10,10)
    	expect(calc.answer).to eq(20)
  	end
  	it "addition opposite signs" do
    	calc.addition(-10,10)
    	expect(calc.answer).to eq(0)
  	end
  end

  describe '#subtract' do
    it "subtract numbers" do
    	calc.subtract(10,10)
    	expect(calc.answer).to eq(0)
  	end
  	it "subtract opposite signs" do
    	calc.subtract(-10,10)
    	expect(calc.answer).to eq(-20)
  	end
  end

  describe '#multiply' do
    it "multiply numbers" do
    	calc.multiply(10,10)
    	expect(calc.answer).to eq(100)
  	end
  	it "multiply same signs and 1x1" do
    	calc.multiply(-1,-1)
    	expect(calc.answer).to eq(1)
  	end
  	it "multiply opposite signs" do
    	calc.multiply(-10,2)
    	expect(calc.answer).to eq(-20)
  	end
  	it "multiply by 0" do
    	calc.multiply(10,0)
    	expect(calc.answer).to eq(0)
  	end
  end

  describe '#divide' do
    it "divide numbers" do
    	calc.divide(10,10)
    	expect(calc.answer).to eq(1)
  	end
  	it "divide opposite signs" do
    	calc.divide(-100,10)
    	expect(calc.answer).to eq(-10)
  	end
  	it "divide same signs" do
    	calc.divide(-10,-1)
    	expect(calc.answer).to eq(10)
  	end
  	it "divide by zero to raise error" do
    	calc.divide(-100,0)
    	expect(calc.err).not_to be_nil
  	end
  end
end