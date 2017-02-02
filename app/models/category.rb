class Category < ActiveRecord::Base

  has_many :centers
  mount_uploader :image, ImageUploader

end