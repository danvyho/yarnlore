class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :notify_followers

  private

  def notify_followers
    post.followers.each do |follower|
      Notification.create!(
        user: follower,
        notifiable: self,
        notification_type: :comment_on_followed_post
      )
    end
  end
  after_create :notify_parent_comment_owner

  def notify_parent_comment_owner
    return unless parent_comment && parent_comment.user != user

    Notification.create!(
      user: parent_comment.user,
      notifiable: self,
      notification_type: :reply_to_comment
    )
  end
end
