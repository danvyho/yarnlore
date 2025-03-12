class RemoveProgressFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :progress, :integer
    remove_column :users, :goal, :integer
  end
end
