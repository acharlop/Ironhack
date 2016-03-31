class Login
	def initialize()
		@username = "avicharls"
		@password = "ruby123"
		@logged_in = false
		@attempt = 0
	end
	def login(username, password)
		@logged_in = (@username == username && @password == password)
		if @logged_in
			puts "You have logged in successfully!"
		else
			puts "Your login was incorrect please try again"
		end
	end
	def logged_in?
		@logged_in
	end
end