class Blog
	attr_reader :posts
	def initialize
		@posts = []
	end
	def add_post(post)
		@posts.push(post)
	end
	def latest_posts
		@posts.sort_by{|p| p.date}
	end
end