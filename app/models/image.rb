class Image < ApplicationRecord
  belongs_to :diary, optional: true
end
