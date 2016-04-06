class User
	def initialize
		@users = {
			"avi"=>"12345",
			"test"=>"abcde"
		}
	end
	def validate_user(username, password)
		@users[username] == password
	end
end

