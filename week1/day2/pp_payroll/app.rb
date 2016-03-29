require_relative "lib/employee.rb"
require_relative "lib/payroll.rb"



employees = [
abdul = HourlyEmployee.new("Abdul","abc@123.com",15,55),
avi = HourlyEmployee.new("Avi","abc@123.com",15,50),
josh = HourlyEmployee.new("Josh","abc@123.com",15,40),
nizar = SalaryEmployee.new("Nizar","nizar@ironhack.com",100000),
ted = MultiPaymentEmployee.new("ted","ted@doyoureallyexist.com",60000,275,55)
]

weekly_salary = Payroll.new(employees)
weekly_salary.calculate_payroll