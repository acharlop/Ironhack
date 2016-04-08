require_relative "../lib/movie_search.rb"
require "uri"

describe MovieSearch do
  before(:all) do
  	@movies = MovieSearch.new("funny","year")
  end

  describe '#list' do
    describe 'return types' do
      it 'array' do
      	expect(@movies.list.class).to be Array
      	expect(@movies.list.length).to be >= 1
      end
      it 'of hashes' do
      	expect(@movies.list.sample.class).to be Hash
      	expect(@movies.list.sample.size).to eq 2
      end
    end
    describe 'each movie contains 'do 
    	it 'the url for poster' do
    		expect(@movies.list.sample[:poster].match URI.regexp("http")).to_not be_nil
      end
      it 'year' do
      	expect(@movies.list.sample[:release_date]).to be_between(1900,Time.now.year).inclusive
      end
    end
  end
end