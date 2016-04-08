require "sinatra"
require "sinatra/reloader"
require "require_all"
require_all "lib"
users = User.new
enable(:sessions)
task_list = ToDoList.new("avi")

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
		redirect to("/user/#{session[:logged_in_user]}")
	else
		session[:logged_in_user] = nil
		redirect to("/")
	end
end

get "/user/:username" do
	if session[:logged_in_user].nil?
		erb(:login)
	else
		@user = params[:username]
		task_list.load
		@todo_list = task_list.tasks
		erb(:user)
	end
end

get "/new_task" do
	erb(:new_task)
end

post "/new_task" do
	if params["task"]
		task = Task.new(params[:task])
		task_list.add_task(task)
		redirect to("/user/#{session[:logged_in_user]}")
	else
		erb(:new_task)
	end

end

get "task/:id" do
	@task = task_list.find_task_by_id(params[:id])
	erb(:task)
end

post "/logout" do
	session[:logged_in_user] = nil
	session[:list] = nil
	erb(:login)
end