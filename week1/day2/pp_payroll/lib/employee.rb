require_relative "payment_modules.rb"

class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
	include HourlyPay
	def initialize(name, email, hourly_rate, hours_worked)
	 	super(name, email)
	 	@hourly_rate = hourly_rate
	 	@hours_worked = hours_worked
	end
	def calculate_salary
		hourly_pay(@hourly_rate, @hours_worked)
	end
end

class SalaryEmployee < Employee
	include SalaryPay
	def initialize(name, email, salary_rate)
	 	super(name, email)
	 	@salary_rate = salary_rate
	 end
	def calculate_salary
		salary_pay(@salary_rate)
	end
end

class MultiPaymentEmployee < SalaryEmployee
	include HourlyPay
	include SalaryPay
	def initialize(name, email, salary_rate, hourly_rate, hours_worked)
	 	super(name, email, salary_rate)
	 	@hourly_rate = hourly_rate
	 	@hours_worked = hours_worked
	 end
	def calculate_salary
		salary_pay(@salary_rate) + @hours_worked > 40 ? @hourly_rate * (@hours_worked - 40) : 0)
	end
end