# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

species = %w{terrans zerg protoss}
names = ["George Washington", "John Adams", "Thomas Jefferson", "James Madison", "James Monroe", "John Quincy Adams", "Andrew Jackson", "Martin Van Buren", "William Henry Harrison", "John Tyler", "James Polk", "Zachary Taylor", "Millard Fillmore", "Franklin Pierce", "James Buchanan", "Abraham Lincoln", "Andrew Johnson", "Ulysses Grant", "Rutherford Hayes", "James Garfield", "Chester Arthur", "Grover Cleveland", "William McKinley", "Theodore Roosevelt", "William Taft", "Woodrow Wilson", "Warren Harding", "Calvin Coolidge", "Herbert Hoover", "Franklin Roosevelt ", "Harry Truman", "Dwight Eisenhower", "John Kennedy", "Lyndon Johnson", "Richard Nixon", "Gerald Ford", "Ronald Reagan", "George Bush", "Bill Clinton", "Barack Obama"]
dates = [1.year.ago..Time.now]

players = names.map{ |p| Player.create(name: p)}

300.times do
	w, l = players.shuffle.take(2)
	wf, lf = species.shuffle.take(2)
	Match.create(
		winner_faction: wf, 
		loser_faction: lf,
		duration: rand(100),
		date: rand(1..200).days.ago,
		winner: w,
		loser: l)
end