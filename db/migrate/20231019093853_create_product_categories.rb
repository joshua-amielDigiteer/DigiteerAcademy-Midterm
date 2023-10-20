class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.references :product_types, null: false, foreign_key: true

      t.timestamps
    end
    add_index :product_categories, :name, unique: true
  end
end
