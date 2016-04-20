class AddColsToProduct < ActiveRecord::Migration
  def change
  	add_reference :users, index: true
    add_column :products, :title, :string
    add_column :products, :description, :text
    add_column :products, :deadline, :datetime
  end
end
