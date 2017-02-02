class AddLatLonToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :latitude, :float
    add_column :centers, :longitude, :float
  end
end
