class FizzBuzz
	def to_s(n)
		string = ""
		string << "Fizz" if n % 3 == 0
		string << "Buzz" if n % 5 == 0
		string << n.to_s if string.empty?
		string
	end
end