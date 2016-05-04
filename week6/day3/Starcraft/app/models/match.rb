class Match < ActiveRecord::Base
  belongs_to :winner
  belongs_to :loser
end
