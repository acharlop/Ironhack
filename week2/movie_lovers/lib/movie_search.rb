require "imdb"
require_relative "movie_keys"
require_relative "movie_prompts"
class MovieSearch
	include MovieKeys
	include MoviePrompts
	attr_reader :list, :type, :prompt
	def initialize(search,type)
		@search = Imdb::Search.new(search).movies
		@list = []
		@type = type.to_sym
		@prompt = ""
		build_list
	end
	def winner
		win = (0...@list.length).to_a.sample
		self.send(@type.to_s+"_prompt", @list[win])
		win
	end
	def build_list
		if @search.length > 2
			thread_build_list(0)
		else
			@prompt = "Chosing between 1 and itself is beyond the scope of this game\nTry a less specific search term"
		end
	end
	def thread_build_list(count=0)
		end_count = count + 10
		threads = []
		(count..end_count).each do |i|
			if i < @search.length
				threads <<  Thread.new { add_to_list(@search[i])}
			end
		end
		threads.each do |t| 
			t.join
			if @list.length < 9 && t["key"]
				@list.push({
					:poster=>t["poster"], 
					t["key"] => t["val"]
				})
			end
		end
		end_count += 1
		if @list.length < 9 && end_count < @search.length
			thread_build_list(end_count)
		end
	end
	def add_to_list(movie)
		poster = movie.poster
		return unless poster
		Thread.current["poster"] = poster
		Thread.current["key"],Thread.current["val"] = self.send(@type, movie)
	end
	
end








