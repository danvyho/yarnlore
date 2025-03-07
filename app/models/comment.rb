class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :notifications, through: :post, as: :notifiable, dependent: :destroy
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  has_many :comment_likes, dependent: :destroy
  validates :content, presence: true, length: { minimum: 2, maximum: 1000 }
end
