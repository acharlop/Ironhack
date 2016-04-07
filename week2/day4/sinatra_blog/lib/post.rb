class Post
	attr_reader :title, :text, :date, :author, :category
	def initialize(title,text,author="na",category="none")
		@title = title
		@text = text
		@date = Time.now
		@author = author
		@category = category
	end
end