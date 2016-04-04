require_relative "../lib/movies.rb"
require "imdb"

RSpec.describe "Movie testing" do
	let(:movie) {Movie.new("Star Wars")}

	it "movie initialized with a buzz of 1" do
		expect(movie.buzz).to eq(1)
	end
	it "movie idea starts with nobody working on it" do
		expect(movie.roles.values).to eq([[],[],[],[],[]])
	end
	it "person can be added to role" do
		movie.add_worker("test person",:director)
		movie.add_worker("test person",:star)
		expect(movie.roles[:director]).to eq(["test person"])
		expect(movie.roles[:star]).to eq(["test person"])
	end
	it "person can be fired" do
		movie.fire_worker("test person")
		expect(movie.roles.values).to eq([[],[],[],[],[]])
	end
	it "director endorcement" do
		person = "test person"
		movie.add_worker(person,:director)
		movie.endorse(person)
		expect(movie.buzz).to eq(3)
	end
	it "non director endorcement" do
		person = "test person"
		movie.add_worker(person,:star)
		movie.endorse(person)
		expect(movie.buzz).to eq(2)
	end
	it "both endorcement" do
		p1 = "test person"
		p2 = "test person2"
		movie.add_worker(p1,:director)
		movie.add_worker(p2,:writer)
		movie.endorse(p1)
		movie.endorse(p2)
		expect(movie.buzz).to eq(4)
	end
	it "non worker endorcement" do
		movie.non_worker_endorse("test",:director)
		expect(movie.buzz).to eq(2)
		movie.non_worker_endorse("test2",:director)
		expect(movie.buzz).to eq(4)
	end
	it "non worker - writer endorcement" do
		movie.non_worker_endorse("test",:writer)
		expect(movie.buzz).to eq(1)
		movie.non_worker_endorse("test",:director)
		expect(movie.buzz).to eq(2)
		movie.non_worker_endorse("test",:writer)
		expect(movie.buzz).to eq(2)
	end
	it "Test adding 2 salarys" do
		p1 = "test person"
		p2 = "test person2"
		movie.add_worker(p1,:director)
		movie.add_worker(p2,:writer,20000)
		expect(movie.salarys.length).to eq(2)
	end
	it "Test getting max salarys" do
		p1 = "test person"
		p2 = "test person2"
		movie.add_worker(p1,:director,20)
		movie.add_worker(p2,:writer,10)
		expect(movie.largest_salary).to eq(20)
	end
	it "Raise exception on larger salary add" do
		p1 = "test person"
		p2 = "test person2"
		movie.add_worker(p1,:director,20)
		expect{movie.add_worker(p2,:writer,40)}.to raise_error(CantBelieveIt)
	end

	# it "buzz can be added" do
	# 	movie.endorse("test person")
	# end
end