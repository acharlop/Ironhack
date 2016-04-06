require_relative "../lib/poi.rb"
require_relative "../lib/city.rb"

RSpec.describe City do |c|
	before(:all) do
		comment = Proc.new{ ('a'..'z').to_a.sample(rand(26)).join(" ") }
		@iron_hack = PointOfInterest.new("Iron Hack")
		10.times{ @iron_hack.add_visit }
		10.times{ @iron_hack.add_comment(comment.call)}

		@rest = PointOfInterest.new("Sushi Restuarant")
		9.times{ @rest.add_visit }
		9.times{ @rest.add_comment(comment.call)}		

		@bbg = PointOfInterest.new("Breaking Bad Gymnasium")
		8.times{ @bbg.add_visit }
		8.times{ @bbg.add_comment(comment.call)}		

		@beach = PointOfInterest.new("The Beach")
		7.times{ @beach.add_visit }
		7.times{ @beach.add_comment(comment.call)}	

		@output = [@iron_hack,@rest,@bbg,@beach]
	end
	let(:city) {City.new("Miami")}
	describe '#add_poi' do
		it 'add poi to city' do
			expect(city.count_pois).to eq(0)
			city.add_poi(@iron_hack)
			expect(city.count_pois).to eq(1)
		end
		it 'count number of poi\'s in city' do
			expect(city.count_pois).to eq(0)
			city.add_poi(@iron_hack)
			expect(city.count_pois).to eq(1)
			city.add_poi(@rest)
			expect(city.count_pois).to eq(2)
			city.add_poi(@bbg)
			expect(city.count_pois).to eq(3)
			city.add_poi(@beach)
			expect(city.count_pois).to eq(4)
		end
  end
  describe '#search' do
  	
    it 'search when no cities' do
    	expect(city.search(:number_of_visits,:ASC)).to be_empty
    	expect(city.search(:number_of_visits,:DESC)).to be_empty
    end
    it 'search by views ascending' do
			input = city.search(:number_of_visits,:ASC)
    	expect(input).to eq(@output.reverse)
    end
    it 'search by views descending' do
			input = city.search(:number_of_visits,:DESC)
    	expect(input).to eq(output)
    end
    it 'search by a count - ascending' do
    	
    end
    it 'search by a count - descending' do
    	
    end
    it 'search by number of comments - ascending' do
    	
    end
    it 'search by number of comments - descending' do
    	
    end
    it 'search by number of comments - ascending' do
    	
    end
    it 'search by number of comments - descending' do
    	
    end
  end
end
