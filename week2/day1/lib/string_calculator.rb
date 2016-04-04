class StringCalculator
	def add(str)
		str.split(",")
			.map(&:to_i)
			.reduce(0,:+)
	end
end