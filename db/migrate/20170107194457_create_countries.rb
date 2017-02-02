class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.binary :image

      t.timestamps
    end
    add_index :countries, :name
  end
end