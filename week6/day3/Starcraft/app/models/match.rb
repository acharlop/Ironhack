class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"
  # belongs_to :blah, class_name: :blah, foreign_key: :blah_id
end
