class AddTagIdToCenters < ActiveRecord::Migration[5.0]
  def change
    add_column :centers, :tag_id, :integer
  end
end
