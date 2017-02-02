class Tag < ApplicationRecord
  has_many :taggings
  has_many :centers, through: :taggings
  mount_uploader :image, ImageUploader

end
