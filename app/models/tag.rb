class Tag < ApplicationRecord
  has_many :posts_tags
  has_many :posts, through: :posts_tags
  validates :name, presence: true
  validates :name, uniqueness: true

end
