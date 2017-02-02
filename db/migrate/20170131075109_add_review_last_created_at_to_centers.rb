class AddReviewLastCreatedAtToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :review_last_created_at, :datetime
  end
end
