class StringCalculator
	def add(str)
		nums = str.split(",")
		nums.inject(0){|s,i| s += i.to_i}
	end
end