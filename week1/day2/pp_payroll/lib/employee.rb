class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
	def initialize(name, email, hourly_rate, hours_worked)
	 	super(name, email)
	 	@hourly_rate = hourly_rate
	 	@hours_worked = hours_worked
	end
	def calculate_salary
		@hourly_rate * @hours_worked
	end
end

class SalaryEmployee < Employee
	def initialize(name, email, salary_rate)
	 	super(name, email)
	 	@salary_rate = salary_rate
	 end
	def calculate_salary
		@salary_rate / 52
	end
end

class MultiPaymentEmployee < SalaryEmployee
	def initialize(name, email, salary_rate, hourly_rate, hours_worked)
	 	super(name, email, salary_rate)
	 	@hourly_rate = hourly_rate
	 	@hours_worked = hours_worked
	 end
	def calculate_salary
		(@salary_rate / 52) + (@hours_worked > 40 ? @hourly_rate * (@hours_worked - 40) : 0)
	end
end