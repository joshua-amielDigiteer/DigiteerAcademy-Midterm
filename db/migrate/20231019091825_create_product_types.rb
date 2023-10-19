class CreateProductTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :product_types do |t|
      t.string :name
      t.text :description
      t.boolean :active

      t.timestamps
    end
  end
end
