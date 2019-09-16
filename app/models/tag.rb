class Tag < ApplicationRecord
  validates :tag_name, presence: true, length:{maximum: 50}
  has_many :taggings, dependent: :destroy
  # has_many :diaries, through: :taggings, source: :diary
  has_many :diaries, through: :taggings

end
