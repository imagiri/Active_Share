class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :diary

  scope :id_is, -> id{
    where(id: id)
  }
  # 検索用
end
