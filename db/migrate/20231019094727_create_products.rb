class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :price
      t.references :product_types, null: false, foreign_key: true
      t.references :product_categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
