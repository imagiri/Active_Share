class Image < ApplicationRecord
  belongs_to :diary, optional: true

  mount_uploader :main_image, ImageUploader
  mount_uploader :sub_image, ImageUploader

end
