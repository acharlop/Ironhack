require_relative "lib/login.rb"
require_relative "lib/wordcount.rb"

puts "Enter your credentials to login"

login = Login.new("user","passwd")

while !login.logged_in?
	print "Username: "
	username = gets.chomp
	print "Password: "
	password = gets.chomp
	login.login(username,password)
end

count = WordCount.new
puts "\nEnter some text and I'll count the words for you"
input = gets.chomp
count.count_words(input)
