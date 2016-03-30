module HourlyPay
	def hourly_pay
		@hourly_rate * @hours_worked
	end
end

module SalaryPay
	def salary_pay
		@salary_rate / 52
	end
end