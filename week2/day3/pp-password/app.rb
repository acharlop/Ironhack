require "sinatra"
require "sinatra/reloader"
require_relative "lib/password.rb"

get "/?:login?" do
	erb(:login)
end

post "/login" do
	email = params[:email]
	password = params[:password]
	checker = PasswordChecker.new
	if checker.check_password(email,password)
		erb(:congrats)
	else
		erb(:login)
	end
end