class Notification < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :notifiable, polymorphic: true  # Supports multiple types of notifications

  enum notification_type: {
    comment_on_followed_post: 0,
    like_on_post: 1,
    new_post_from_followed_user: 2,
    reply_to_comment: 3
  }

  scope :unread, -> { where(read: false) }
end
