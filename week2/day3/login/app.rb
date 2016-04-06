require "sinatra"
require "sinatra/reloader"
require_relative "lib/user.rb"
users = User.new
enable(:sessions)

get "/?" do
	if session[:logged_in_user]
		redirect to("/user/#{session[:logged_in_user]}")
	else
		erb(:login)
	end
end

post "/login" do
	if users.validate_user(params[:username], params[:password])
		session[:logged_in_user] = params[:username]
		@user = params[:username]
		redirect to("/user/#{session[:logged_in_user]}")
	else
		session[:logged_in_user] = nil
		erb(:login)
	end
end

get "/user/:username" do
	if !session[:logged_in_user]
		erb(:login)
	else
		@user = session[:logged_in_user]
		erb(:user)
	end
end

post "/logout" do
	session[:logged_in_user] = nil
	erb(:login)
end