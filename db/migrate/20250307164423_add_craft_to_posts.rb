class AddCraftToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :craft, :string
  end
end
