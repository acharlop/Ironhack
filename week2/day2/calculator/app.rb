require_relative "lib/calculator.rb"
require "sinatra"
require "sinatra/reloader"
calc = Calculator.new

get "/?" do
  erb(:calculate)
end

post "/" do
	@params = params
	a = params[:first_number].to_f
	b = params[:second_number].to_f
	@answer = calc.send params[:method], a, b 
	@sign = calc.sign(params[:method])
	erb(:calculate)
end