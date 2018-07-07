class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  has_many :posts_tags
  has_many :tags, through: :posts_tags

end
