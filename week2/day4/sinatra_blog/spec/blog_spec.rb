require_relative "../lib/post.rb"
require_relative "../lib/blog.rb"
require "rspec"


describe Blog do
	before(:each) do
		@blog = Blog.new
		@post3 = Post.new("title3","text3")
		@post1 = Post.new("title1","text1")
		@post2 = Post.new("title2","text2")
	end
	describe '#posts' do
	  it 'starts with an empty array' do
	  	expect(@blog.posts).to be_empty
	  	expect(@blog.posts).to eq([])
	  end
	  it 'after adding is not empty' do
	  	@blog.add_post @post1
	  	expect(@blog.posts).to_not be_empty
	  	expect(@blog.posts).to eq([@post1])
	  end
	end
	describe '#add_post' do
		it 'adds to empty posts array' do
	  	expect(@blog.posts).to be_empty
	  	@blog.add_post(@post1)
	  	expect(@blog.posts).to eq([@post1])
	  	expect(@blog.posts.length).to eq(1)
	  	@blog.add_post(@post2)
	  	expect(@blog.posts).to eq([@post1,@post2])
	  	expect(@blog.posts.length).to eq(2)
		end
	end
	describe '#latest_posts' do
	  it 'returns array of posts by creation time' do
	  	@blog.add_post @post1
	  	@blog.add_post @post3
	  	expect(@blog.latest_posts).to eq [@post3,@post1]
	  	post = Post.new("title","text")
	  	@blog.add_post post
	  	@blog.add_post @post2
	  	expect(@blog.latest_posts).to eq [@post3,@post1,@post2,post]
	  end
	end
	describe '#by_author' do
	  it 'returns all posts by one author organized by date' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	@blog.add_post @post3
	  	expect(@blog.by_author("na")).to eq [@post3,@post1,@post2]
	  end
	  it 'does not return posts by a different author' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	tmp_post = Post.new("post","texting","not na")
	  	@blog.add_post tmp_post
	  	expect(@blog.by_author("not na")).to eq [tmp_post]
	  end
	  it 'returns empty if posts by auther or author not found' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	@blog.add_post @post3
	  	expect(@blog.by_author("not na")).to be_empty
	  end
	end
  describe '#by_category' do
	  it 'returns all posts by one author organized by date' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	@blog.add_post @post3
	  	expect(@blog.by_category("none")).to eq [@post3,@post1,@post2]
	  end
	  it 'does not return posts by a different author' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	tmp_post_t = Post.new("post","texting","not na","none")
	  	tmp_post_f = Post.new("post","texting","not na","other")
	  	@blog.add_post tmp_post_t
	  	@blog.add_post tmp_post_f
	  	expect(@blog.by_category("other")).to eq [tmp_post_f]
	  end
	  it 'returns empty if posts by auther or author not found' do
	  	@blog.add_post @post1
	  	@blog.add_post @post2
	  	@blog.add_post @post3
	  	expect(@blog.by_category("other")).to be_empty
	  end
	end
	describe '#save' do
		it 'save task none empty yml file' do
	  	@blog.add_post @post2
			@blog.save
			tmp_blog = Blog.new
			expect(tmp_blog.posts.length).to eq 0
			tmp_blog.load
			expect(tmp_blog.posts.length).to eq 1
	  end	  
	end
	describe '#load' do
	  it 'load task into empty blog from past save' do
	  	tmp_blog = Blog.new
			expect(tmp_blog.posts.length).to eq 0
			tmp_blog.load
			expect(tmp_blog.posts.length).to eq 1
	  end
	end
end