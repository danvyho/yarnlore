class AddPatternToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :pattern, :boolean
  end
end
