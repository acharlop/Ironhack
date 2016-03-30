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
		hourly_pay
	end
end

class SalaryEmployee < Employee
	include SalaryPay
	def initialize(name, email, salary_rate)
	 	super(name, email)
	 	@salary_rate = salary_rate
	 end
	def calculate_salary
		salary_pay
	end
end

class MultiPaymentEmployee < SalaryEmployee
	include HourlyPay
	include SalaryPay
	def initialize(name, email, salary_rate, hourly_rate, hours)
	 	super(name, email, salary_rate)
	 	@hourly_rate = hourly_rate
	 	@hours = hours
	 	@hours_worked = hours > 40 ? hours - 40 : 0
	 end
	def calculate_salary
		salary_pay + hourly_pay
	end
end