require_relative "../lib/post.rb"
require "rspec"
require "timecop"

describe Post do
	before(:each) do
		Timecop.freeze
		@title = "This is the post title"
		@text = "This should be a really long text string"
		@post = Post.new(@title, @text)
	end
	after(:each) do
		Timecop.return
	end
  describe '#title' do
    it 'returns title' do
    	expect(@post.title).to eq @title
    end
    it 'does not return the text' do
    	expect(@post.title).to_not eq @text
    end
  end
  describe '#text' do
    it 'returns the post text' do
    	expect(@post.text).to eq @text
    end
    it 'does not return the post title' do
    	expect(@post.text).to_not eq @title
    end
  end
  describe '#date' do
    it 'returns the post creation time' do
			expect(@post.date).to eq(Time.now)	    	
    end
  end
end
