require_relative "../server.rb"
require_relative "../lib/post.rb"
require_relative "../lib/blog.rb"
require "rspec"
require "rack/test"

describe 'Server Service' do
  include Rack::Test::Methods

  def app
  	Sinatra::Application
  end

  it 'blog frontpage load' do
  	get '/'
  	expect(last_response).to be_ok
  end
  it 'blog add page load' do
    get "/new_post"
    expect(last_response).to be_ok
  end
  it 'redirects after creating new post' do
    post "/add_post", params={:title=>"test",:text=>"text"}
    follow_redirect!
    expect(last_request.path).to eq('/')
    expect(last_response).to be_ok
  end
  it 'post page load' do
    post "/add_post", params={:title=>"test",:text=>"text"}
    get '/post/0' 
    expect(last_response).to be_ok
  end
  it 'create author page' do
    post "/author", params={ :author=>"na"}
    expect(last_response).to be_ok
  end

  it 'create author page' do
    post "/category", params={ :category=>"none"}
    expect(last_response).to be_ok
  end

  # it "should load the other page" do
  # 	get '/real_page'
  # 	expect(last_response).to be_ok
  # end
  # it 'should redirect to the real page' do
  # 	get '/hi'
  # 	expect(last_response.redirect?).to be true
  # 	follow_redirect!
  # 	expect(last_request.path).to eq('/real_page')
  # end
  # it "should fail" do
  # 	get "test"
  # 	expect(last_response).to_not be_ok
  # end
end