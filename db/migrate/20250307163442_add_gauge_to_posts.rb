class AddGaugeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :gauge, :string
  end
end
