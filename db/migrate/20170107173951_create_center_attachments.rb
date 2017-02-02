class CreateCenterAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :center_attachments do |t|
      t.integer :center_id
      t.string :cover

      t.timestamps
    end
  end
end
