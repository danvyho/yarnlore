class PostLike < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :notify_post_owner

  private

  def notify_post_owner
    return if post.user == user  # Don't notify if the user likes their own post

    Notification.create!(
      user: post.user,
      notifiable: self,
      notification_type: :like_on_post
    )
  end
end
