class CenterAttachment < ApplicationRecord
   mount_uploader :cover, CoverUploader
   belongs_to :center
end
