class Blog
	attr_reader :name
	def initialize(name)
		@name = name
		@posts = []
	end
	def add_post(article)
		@posts.push(article)
	end
	def print_post(article)
		puts article.title
		puts article.title.length.times.collect{"*"}.join('')
		puts article.post
		puts article.title.length.times.collect{"-"}.join('')
	end
	def print_title
		title = "$ Welcome to #{@name}! $"
		pad = title.length.times.collect{"$"}.join('')
		puts pad
		puts title
		puts pad
		puts	
	end
	def publish_front_page
		print_title
		@posts.each do |p|
			print_post(p)
		end
	end
end