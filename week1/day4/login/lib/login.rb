class Login
	def initialize(username,password)
		@username = username
		@password = password
		@logged_in = false
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