class PasswordChecker
	def initialize
		@password = ''
		@email = ''
	end
	def check_password(email, password)
		@password = password.scan(/\S+/).join("")
		@email = email
		# tests
		length_check &&
		one_of_each_check &&
		name_domain_check
	end

	private
	def length_check
		@password.length > 7
	end
	def one_of_each_check
		!(@password[/[a-z]/].nil? ||
			@password[/[A-Z]/].nil? ||
			@password[/\W/].nil? ||
			@password[/[0-9]/].nil?
			)
	end
	def name_domain_check
		name = @email.split("@")[0]
		domain = @email[/@(.+)\./, 1]
		!(@password.include?(name) ||
			@password.include?(domain))
	end
end