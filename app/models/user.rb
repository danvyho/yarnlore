class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :notifications
  has_many :comments
  has_many :comment_likes
  has_many :favorites
  has_many :posts, dependent: :destroy
  has_many :post_likes
  has_many :followings
  has_many :messages
  has_many :memberships
  has_one_attached :avatar
  include PgSearch::Model
  # multisearchable against: :username

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validate :avatar_validation

  private

  def avatar_validation
    if avatar.attached? && !avatar.content_type.in?(%w(image/jpeg image/png))
      errors.add(:avatar, 'must be a JPEG or PNG')
    elsif avatar.attached? && avatar.byte_size > 5.megabytes
      errors.add(:avatar, 'size should be less than 5MB')
    end
  end
end
