require_relative "lib/employee.rb"

worker = MultiPaymentEmployee.new("Abdul","abc@123.com",100000,250,50)

p worker.calculate_salary