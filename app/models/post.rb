class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :notifications
  has_many :favorites
  has_many :post_likes
  has_one_attached :image
  include PgSearch::Model
  multisearchable against: %i[title content]
end
