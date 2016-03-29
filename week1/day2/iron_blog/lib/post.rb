class Post
	attr_reader :title, :post
	def initialize(title,post,date)
		@title = title
		@post = post
		@date = date
	end
end