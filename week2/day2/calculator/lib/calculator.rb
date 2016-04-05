class Calculator
	attr_reader :answer
	def initialize
		@answer = nil
	end
	def addition(a,b)
		@answer = a + b.to_f
	end
	def subtract(a,b)
		@answer = a - b.to_f
	end
	def multiply(a,b)
		@answer = a * b.to_f
	end
	def divide(a,b)
		@answer = b != 0 ? a / b.to_f : false
	end
	def sign(method)
		case method
			when "addition"
				"+"
			when "subtract" 
				"-"
			when "multiply"
				"*"
			when "divide"
				"/"
			else
				"That opperation isn't recognized"
		end
	end
end

