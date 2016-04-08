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
	movies = MovieSearch.new(params[:search],params[:type])
	@movie_list = movies.list.shuffle!
	@winner = movies.winner
	@prompt = movies.prompt
	erb(:play)
end