class Payroll
	def initialize(employees)
		@employees = employees
	end
	def calculate_payroll
		total = @employees.reduce(0.0) do |s,e| 
			puts "#{e.name} => $#{e.calculate_salary}.00 and netting $#{e.calculate_salary * 0.82}"
			s + e.calculate_salary 
		end
		puts "Total payroll for the week is $#{total}.00"
	end
end