class Player < ActiveRecord::Base
	belongs_to :winner, class_name: :match
	belongs_to :loser, class_name: :match
end
