class AddSlugToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :slug, :string
    add_index :centers, :slug, unique: true
  end
end
