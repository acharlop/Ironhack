class Blog
	attr_reader :name
	def initialize(name)
		@name = name
		@posts = []
		@posts_per_page = 3 # using array indexing
		@page = 1
		@last_page = 1
	end
	def add_post(article)
		@posts.push(article)
	end
	def print_post(article)
		if article.sponsered?
			print_title article.title
		else
			puts "#{article.title} | #{article.date}"
		puts article.title.length.times.collect{"*"}.join('')
		end
		puts article.post
		puts article.title.length.times.collect{"-"}.join('')
	end
	def print_title(title=nil)
		mid = "$ #{title.nil? ? "Welcome to " << @name <<"!" : title} $"
		pad = mid.length.times.collect{"$"}.join('')
		puts pad
		puts mid
		puts pad
	end
	def publish_page(starting = 0, ending = @posts.length, paged=false)
		print_title 
		puts
		@posts[starting..ending].each {|p| print_post p }
		if paged
			puts "\n" << (1..@last_page).collect{|i| i == @page ? i.to_s.colorize(:red) : i }.join(" ")
		end
	end
	def get_page
		start = (@page - 1) * @posts_per_page
		ending = start + @posts_per_page - 1
		publish_page(start, ending, true)
	end
	def get_first_page
		@posts.sort_by!{|p| p.date}.reverse!
		@last_page = (@posts.length / @posts_per_page.to_f).ceil
		get_page
	end
	def is_first_page?
		@page == 1 ? true : false
	end
	def is_last_page?
		@page == @last_page ? true : false
	end
	def next_page
		if is_last_page?
			puts "You have made a grave mistake. Please check your logic, or are you a robot?"
		else
			@page +=1
		end
		get_page
	end
	def previous_page
		if is_first_page?
			puts "You have made a grave mistake. Please check your logic, or are you a robot?"
		else
			@page -= 1
		end
		get_page
	end
end