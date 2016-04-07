class Post
	attr_reader :title, :text, :date
	def initialize(title,text)
		@title = title
		@text = text
		@date = Time.now
	end
end