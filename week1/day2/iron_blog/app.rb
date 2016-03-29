require_relative "lib/blog.rb"
require_relative "lib/post.rb"

blog = Blog.new("IronBlog")
blog.add_post Post.new("First Post!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye","date")
blog.add_post Post.new("Second Post!","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye","date")
blog.add_post Post.new("Third Post, not as exciting","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye","date")
blog.add_post Post.new("An article about nothing","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye","date")
blog.add_post Post.new("The last post ever","There is a lot to say on this here first line of awesome nothingness. So I will stop typing and get back to coding. Goodbye","date")

blog.publish_front_page
