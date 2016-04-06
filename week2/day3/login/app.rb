require "sinatra"
require "sinatra/reloader"
require_relative "lib/user.rb"
users = User.new
enable(:session)

get "/?" do
	if session[:logged_in_user]
		redirect to("/user/#{session[:logged_in_user]}")
	end
	erb(:login)
end

post "/login" do
	if users.validate_user(params[:username], params[:password])
		session[:logged_in_user] = params[:username]
	else
		session[:logged_in_user] = nil
		redirect to(:login)
	end
	erb("/user/#{session[:logged_in_user]}")
end

get "/user/:username" do
	if !session[:logged_in_user]
		redirect to(:login)
	end
		@user = session[:logged_in_user]
		erb(:user)
end