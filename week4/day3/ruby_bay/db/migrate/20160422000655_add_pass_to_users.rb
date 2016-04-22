class AddPassToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :text
  end
end
