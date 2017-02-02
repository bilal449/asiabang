class Review < ActiveRecord::Base

  belongs_to :center, touch: :review_last_created_at
  belongs_to :user
  has_many :ratings, class_name: 'Rate'

end