class DropGoalsandUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :goals
    drop_table :users
  end
end
