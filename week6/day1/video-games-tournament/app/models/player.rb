class Player < ActiveRecord::Base
	has_many :registration
	has_many :tournaments, through: :registration
end
