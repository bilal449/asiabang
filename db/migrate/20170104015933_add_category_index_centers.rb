class AddCategoryIndexCenters < ActiveRecord::Migration[5.0]
  def change
    add_reference :centers, :category, index: true
  end
end
