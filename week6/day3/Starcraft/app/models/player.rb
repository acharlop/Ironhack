class Player < ActiveRecord::Base
	has_many :winning_matches, class_name: "Match", foreign_key: :winner_id
	has_many :losing_matches, class_name: "Match", foreign_key: :winner_id
	# has_many :blahs, class_name: :blah, foreign_key: :blah_id
end
