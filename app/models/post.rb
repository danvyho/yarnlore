class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications
  has_many :favorites
  has_many :post_likes, dependent: :destroy
  has_one_attached :image
  include PgSearch::Model
  multisearchable against: %i[title content]
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true



end
