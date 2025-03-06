class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :collections
end
