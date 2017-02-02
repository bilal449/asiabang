class InitialSchema < ActiveRecord::Migration[5.0]
  def change

    create_table :centers do |t|
      t.string :name
      t.text :description
      t.string :address1
      t.string :address2
      t.string :city
      t.string :postnummer
      t.string :telefon
      t.string :email
    end

    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
    end

    create_table :kategoris do |t|
      t.string :name
    end
  end
end
