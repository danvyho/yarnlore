class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :notifications
  has_many :comments
  has_many :comment_likes
  has_many :favorites
  has_many :posts
  has_many :post_likes
  has_many :followings
  has_many :messages
  has_many :memberships
  has_many :collections
  include PgSearch::Model
  multisearchable against: :username
end
