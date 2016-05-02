class FixTournamentName < ActiveRecord::Migration
  def change
  	rename_column :registrations, :tornament_id, :tournament_id
  end
end
