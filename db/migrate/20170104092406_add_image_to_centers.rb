class AddImageToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :image, :string
  end
end
