class AddNeedleSizeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :needle_size, :string
  end
end
