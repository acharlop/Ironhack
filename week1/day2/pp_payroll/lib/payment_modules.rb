module HourlyPay
	def hourly_pay(rate, hours)
		rate * hours
	end
end

module SalaryPay
	def salary_pay(rate)
		rate / 52
	end
end