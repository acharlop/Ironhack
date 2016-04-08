require_relative "lib/movie_search"
require "sinatra"
require "sinatra/reloader"

get "/" do
	erb(:index)
end

get "/play" do
	redirect to "/"
end

post "/play" do
	# 13.1
	# now = Time.now
	movies = MovieSearch.new(params[:search],params[:type])
	@movie_list = movies.list
	@winner = (0..@movie_list.length-1).to_a.sample
	@year = @movie_list[@winner][:year]
	# p Time.now - now
	erb(:play)
end