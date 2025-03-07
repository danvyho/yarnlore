class AddYarnWeightToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :yarn_weight, :string
  end
end
