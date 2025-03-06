class AddVideoToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :video, :string
  end
end
