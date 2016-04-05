require 'sinatra'
get '/' do
	"Hello world"
end
get '/author' do
	erb :author
end
get '/ironside' do
	erb :ironside
end
get '/hi' do
	@greeting = "Hello World"
	erb(:hipage)
end
get '/date' do
	@date = Date.today
	erb(:date)
end
get '/pizza' do
	@ingredients = ["sauce","cheese","dough","peperoni"]
	erb(:loop)
end
get "/users/:username" do
	@username = params[:username]
	erb(:user_profile)
end
get "/hours/:direction/:hours_back" do
	# change hours to seconds
	@time_diff = params[:hours_back].to_i * 60 * 60 
	@direction = params[:direction]
	if @direction == "ago"
		@time_diff = 0 - @time_diff
	end
	erb(:hours)
end