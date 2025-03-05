class Chat < ApplicationRecord
  has_many :messages
  has_many :memberships
end
