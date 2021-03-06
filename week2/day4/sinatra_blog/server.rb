require "sinatra"
require "sinatra/reloader"
require_relative "lib/post.rb"
require_relative "lib/blog.rb"
include Module: WillPaginate::Sinatra::Helpers
WillPaginate.per_page = 10
blog = Blog.new
blog.load

get '/' do
	@posts = WillPaginate::Post.paginate(blog.latest_posts)
	# @posts.paginate(:page => params[:page, :per_page => 30])
	erb(:blog)
end

get "/post/:id" do
	@post = blog.posts[params[:id].to_i]
	erb (:post)
end

get "/new_post" do
	erb(:new)
end	

post "/add_post" do
	title = params[:title]
	text = params[:text]
	author = params[:author] ? params[:author] : "avi"
	category = params[:category] ? params[:category] : "none"
	blog.add_post(Post.new(title,text,author,category))
	blog.save
	redirect "/"
end

post "/author" do
	@posts = blog.by_author(params[:author])
	erb(:blog)
end
	
post "/category" do
	@posts = blog.by_category(params[:category])
	erb(:blog)
end