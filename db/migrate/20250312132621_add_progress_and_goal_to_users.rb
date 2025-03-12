class AddProgressAndGoalToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :goal, :integer, default: 0, null: false
    add_column :users, :progress, :integer, default: 0, null: false
  end
end
