require_relative "../lib/poi.rb"

RSpec.describe PointOfInterest do
	let(:poi) {PointOfInterest.new("Test")}
  describe '#add_visit' do
  	it 'starts with no visits' do
  		expect(poi.number_of_visits).to eq(0)
  	end
  	it 'can add a visit' do
  		poi.add_visit
  		expect(poi.number_of_visits).to eq(1)
  	end
  	it 'can add multiple visits' do
  		10.times { poi.add_visit }
  		expect(poi.number_of_visits).to eq(10)
  	end
  end
  describe '#number_of_visits' do
  	it 'get a count of number of visits' do
  		10.times { poi.add_visit }
  		expect(poi.number_of_visits).to eq(10)
  	end
  end
  describe '#add_comment' do
    it 'can add a comment' do
			poi.add_comment("added nice test comment")
			expect(poi.number_of_comments).to eq(1)    	
    end
    it 'can add multiple comments' do
    	10.times{ poi.add_comment("added nice test comment") }
			expect(poi.number_of_comments).to eq(10)
    end
  end
  describe '#number_of_comments' do
    it 'get a count of number of comments' do
			expect(poi.number_of_comments).to eq(0)
    	10.times{ poi.add_comment("added nice test comment") }
			expect(poi.number_of_comments).to eq(10)
    end
  end
  describe '#a_counting' do
    it 'count the number of a\'s in the poi name' do
    	expect(poi.a_count).to eq(0)
    	test = PointOfInterest.new("All day Avi Air")
    	expect(test.a_count).to eq(4)
    end
  end
  describe '#avg_words_per_comment' do
  	it 'test 0' do
    	expect(poi.avg_words_per_comment).to eq(0)
  	end
    it 'test 1' do
    	poi.add_comment("asdf asdf asdf asdf asdf")
    	poi.add_comment("asdf asdf asdf asdf asdf asdf")
    	poi.add_comment("asdf asdf asdf asdf asdf asdf asdf")
    	expect(poi.avg_words_per_comment).to eq(6)
    end
    it 'test 2' do
    	poi.add_comment("asdf asdf asdf asdf asdf asdf")
    	poi.add_comment("asdf asdf asdf asdf asdf asdf")
    	poi.add_comment("asdf asdf asdf asdf asdf asdf asdf")
    	poi.add_comment("asdf asdf asdf asdf asdf asdf asdf")
    	expect(poi.avg_words_per_comment).to eq(6.5)
    end
  end
  describe '#add_criteria' do
    it 'adds criteria to poi class' do
    	expect(poi.criterias.length).to eq(2)
    	poi.add_criteria("num_of_employees",0)
    	expect(poi.criterias.length).to eq(3)
    end
  end
end