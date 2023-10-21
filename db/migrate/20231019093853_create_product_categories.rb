class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.text :description
      t.boolean :active
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
