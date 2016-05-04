class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :winner_faction
      t.string :loser_faction
      t.integer :duration
      t.datetime :date
      t.references :player, :winner, index: true, foreign_key: true
      t.references :player, :loser, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
