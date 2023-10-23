class CreateProductSkus < ActiveRecord::Migration[7.0]
  def change
    create_table :product_skus do |t|
      t.string :code
      t.string :color
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
