# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_19_094727) do
  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.integer "product_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_product_categories_on_product_type_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "price"
    t.integer "product_types_id", null: false
    t.integer "product_categories_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_categories_id"], name: "index_products_on_product_categories_id"
    t.index ["product_types_id"], name: "index_products_on_product_types_id"
  end

  add_foreign_key "product_categories", "product_types"
  add_foreign_key "products", "product_categories", column: "product_categories_id"
  add_foreign_key "products", "product_types", column: "product_types_id"
end
