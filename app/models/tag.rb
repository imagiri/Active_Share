class Tag < ApplicationRecord
  has_many :labeling, dependent: :destroy
  has_many :diaries, through: :taggings, source: :diary
end
