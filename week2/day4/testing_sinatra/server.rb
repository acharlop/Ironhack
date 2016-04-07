require "sinatra"
require "sinatra/reloader"

get '/' do
	"You are home!"
end

get "/real_page" do
	"you are on a real page"
end

get "/hi" do
	redirect "/real_page"
end