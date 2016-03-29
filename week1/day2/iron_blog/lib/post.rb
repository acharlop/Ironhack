class Post
	attr_reader :title, :post, :date
	def initialize(title,post,date,sponsered=false)
		@title = title
		@post = post
		@date = date
		@sponsered = sponsered
	end
	def sponsered?
		@sponsered
	end
end