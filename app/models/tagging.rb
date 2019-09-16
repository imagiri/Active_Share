class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :diary
  validates :diary_id,presence:true
  validates :tag_id,presence:true

  scope :id_is, -> id{
    where(id: id)
  }
  # 検索用
end
