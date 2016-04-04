require_relative "../lib/lexi.rb"

RSpec.describe "Lexiconomitron class testing" do
	let(:lexi) {Lexiconomitron.new}
	it "lexi to remove all letter t" do
		input = "great scott!"
		output = "grea sco!"
		expect(lexi.eat_t(input)).to eq(output)
	end
	it "lexi reverse words" do
		input = ["This", "is", "a", "boring", "test"]
		output = ["sih", "se"]
		expect(lexi.shazam(input)).to eq(output)
	end
	it "oompa loompa" do
		input = %w(if you want to be my lover)
		output = %w(if you wan o be my)
		expect(lexi.oompa(input)).to eq(output)
	end

end	