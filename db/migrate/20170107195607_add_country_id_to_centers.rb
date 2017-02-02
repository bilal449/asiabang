class AddCountryIdToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :country_id, :integer
  end
end
