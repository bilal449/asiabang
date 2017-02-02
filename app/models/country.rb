class Country < ApplicationRecord

  has_many :centers
  mount_uploader :image, ImageUploader

end
