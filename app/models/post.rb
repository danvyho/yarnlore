class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :post_likes
  has_many :notifications, as: :notifiable, dependent: :destroy

  after_create :notify_followers

  private

  def notify_followers
    user.followers.each do |follower|
      Notification.create!(
        user: follower,
        notifiable: self,
        notification_type: :new_post_from_followed_user
      )
    end
  end
end
