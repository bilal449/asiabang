class AddReviewIdToRates < ActiveRecord::Migration[5.0]
  def change
    add_column :rates, :review_id, :integer, index: true
  end
end
