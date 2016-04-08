require_relative "blog.rb"
require_relative "post.rb"
author = lambda { ["avi","na","other"].sample }
category = lambda { ["special","not special","none"].sample}
text = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit"
title = "Title "

blog = Blog.new
(1..20).each do | i | 
  blog.add_post Post.new(title + i.to_s, text, author.call, category.call)
end

blog.save

# blog.load