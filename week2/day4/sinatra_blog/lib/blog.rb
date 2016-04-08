require "yaml/store"
class Blog
	attr_reader :posts, :total_pages
	def initialize
		@posts = []
		@blog_store = YAML::Store.new "./lib/blog.yml"
		@total_pages = @posts.length
		@per_page = 10
		# @blog_store = YAML::Store.new "./blog.yml"
	end
	def add_post(post)
		@posts.push(post)
	end
	def latest_posts
		@posts.sort_by{|post| post.date}
	end
	def by_author(author)
		arr = latest_posts
		arr.select { |post| post.author == author}
	end
	def by_category(category)
		arr = latest_posts
		arr.select { |post| post.category == category}
	end
	def save
		@blog_store.transaction do
			@blog_store["blog"] = @posts
		end
	end
	def load
		@blog_store.transaction do
			@posts = @blog_store["blog"]
		end
	end
	# def search(by)
	# 	arr = latest_posts
	# 	author = { |post| post.send(by) == by}
	# 	category = { |post| post.send(by) == by}
	# 	arr.concat catgegory
	# end
end