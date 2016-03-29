require_relative "lib/blog.rb"
require_relative "lib/post.rb"
require 'date'
require 'colorize'

blog = Blog.new("IronBlog")
blog.add_post Post.new("First Post!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 15, true)
blog.add_post Post.new("Second Post!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 14 )
blog.add_post Post.new("Third Post, not as exciting","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 12, false)
blog.add_post Post.new("An article about nothing","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 13, true)
blog.add_post Post.new("The last post ever","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 14)
blog.add_post Post.new("The last last post","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 15)
blog.add_post Post.new("Never mind have much more to say","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 6)
blog.add_post Post.new("I have a little more to say","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 7)
blog.add_post Post.new("Getting there","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 8, true)
blog.add_post Post.new("Almost there, can't wait!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 9)
blog.add_post Post.new("The last post ever for real!!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye",Date.today - 1)

blog.get_first_page
while true
	if blog.is_first_page?
		prompt = "(n)ext, (e)xit"
	elsif blog.is_last_page? 
		prompt = "(b)ack, (e)xit"
	else
		prompt = "(n)ext, (b)ack, (e)xit"
	end
	print prompt << ": "
	dir = gets.chomp[0].downcase
	system "clear"
	if dir == "e"
		puts "Thank you for reading #{@name}! Have a great day"
		break
	elsif dir == "n"
		blog.next_page
	elsif dir == "b"
		blog.previous_page
	else
		puts "Please make a valid selection: "
	end

end


