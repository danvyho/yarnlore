class PostLike < ApplicationRecord
  belongs_to :post
  belongs_to :user
  # has_many :notifications, through: :post, as: :notifiable, dependent: :destroy
  validates :user_id, uniqueness: { scope: :post_id }
end
