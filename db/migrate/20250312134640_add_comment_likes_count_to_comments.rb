class AddCommentLikesCountToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :comment_likes_count, :integer, default: 0, null: false
  end
end
