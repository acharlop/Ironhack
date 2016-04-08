require_relative "../app.rb"
require "rspec"
require "rack/test"

describe 'Movie Lovers Game' do
  include Rack::Test::Methods
  def app
  	Sinatra::Application
  end

 	it "game homepage loads" do
 		get "/"
 		expect(last_response).to be_ok
	end
	it "posts responses to create game page" do
		post "/play", params={:search=>"funny",:type=>"year"}
    expect(last_response).to be_ok 
	end
	it "redirects to homepage if getting play" do
		get "/play" 
		follow_redirect!
		expect(last_request.path).to eq "/"
		expect(last_response).to be_ok
	end
end
