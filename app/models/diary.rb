class Diary < ApplicationRecord
  mount_uploader :main_image, ImageUploader
  mount_uploaders :sub_image, ImageUploader


  belongs_to :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :title, presence: true, length:{maximum: 30}
  validates :content, presence: true, length:{maximum: 3000}
  validates :activity_date, presence: true

  def save_tags(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      taggings = Tag.find_or_create_by(tag_name:new_name)
      self.tags << taggings
    end
  end

  def favorite?(diary, user)
    diary.favorites.find_by(user_id: user.id)
  end

  scope :sort_post, -> {order(created_at: "DESC")}


end
