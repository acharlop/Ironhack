class Tournament < ActiveRecord::Base
	has_many :registration
	has_many :players, through: :registration
end
