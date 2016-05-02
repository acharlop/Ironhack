class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :tornament_id
      t.integer :player_id

      t.timestamps null: false
    end
  end
end
