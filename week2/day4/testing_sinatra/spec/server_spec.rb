require_relative "../server.rb"
require "rspec"
require "rack/test"

describe 'Server Service' do
  include Rack::Test::Methods

  def app
  	Sinatra::Application
  end

  it 'homepage load' do
  	get '/'
  	expect(last_response).to be_ok
  end
  it 'homepage load - fail' do
  	get '/home'
  	expect(last_response).to_not be_ok
  end
  it "should load the other page" do
  	get '/real_page'
  	expect(last_response).to be_ok
  end
  it 'should redirect to the real page' do
  	get '/hi'
  	expect(last_response.redirect?).to be true
  	follow_redirect!
  	expect(last_request.path).to eq('/real_page')
  end
  it "should fail" do
  	get "test"
  	expect(last_response).to_not be_ok
  end
end