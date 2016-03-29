class Payroll
	def initialize(employees)
		@employees = employees
	end
	def notify_employee(employee,payment)
		puts "#{employee.email} Dear Mr/Ms #{employee.name} you will be recieving $#{payment} for your amazing hard work this week"
		puts
	end
	def pay_employees
		total = @employees.reduce(0.0) do |s,e| 
			payment = e.calculate_salary * 0.82
			puts "#{e.name} => $#{e.calculate_salary}.00 and netting $#{payment}"
			notify_employee(e,payment)
			s + e.calculate_salary 
		end
		puts "Total payroll for the week is $#{total}"
	end
end