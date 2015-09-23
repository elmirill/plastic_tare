# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150923071806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "icon"
  end

  create_table "comparison_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "comparison_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comparison_items", ["comparison_id"], name: "index_comparison_items_on_comparison_id", using: :btree
  add_index "comparison_items", ["product_id"], name: "index_comparison_items_on_product_id", using: :btree

  create_table "comparisons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.text     "address_full"
    t.text     "address_short"
    t.string   "email"
    t.string   "phone_main"
    t.string   "phone_other"
    t.string   "map"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "description"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "color_quantity"
    t.integer  "high_quantity"
    t.integer  "spec_quantity"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "item_total"
    t.decimal  "item_vol",       precision: 20, scale: 2
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.float    "total"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.decimal  "total_vol",  precision: 20, scale: 2
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_applications", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "application_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_applications", ["application_id"], name: "index_product_applications_on_application_id", using: :btree
  add_index "product_applications", ["product_id"], name: "index_product_applications_on_product_id", using: :btree

  create_table "product_photos", force: :cascade do |t|
    t.string   "caption"
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "product_photos", ["product_id"], name: "index_product_photos_on_product_id", using: :btree

  create_table "product_types", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "product_types", ["product_id"], name: "index_product_types_on_product_id", using: :btree
  add_index "product_types", ["type_id"], name: "index_product_types_on_type_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "gallery"
    t.string   "capacity"
    t.integer  "volume"
    t.integer  "net_volume"
    t.string   "color"
    t.boolean  "var_color"
    t.integer  "var_color_price_1"
    t.integer  "var_color_price_2"
    t.integer  "var_color_price_3"
    t.boolean  "var_high"
    t.integer  "var_high_price_1"
    t.integer  "var_high_price_2"
    t.integer  "var_high_price_3"
    t.boolean  "var_spec"
    t.integer  "var_spec_price_1"
    t.integer  "var_spec_price_2"
    t.integer  "var_spec_price_3"
    t.boolean  "featured"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "keywords"
    t.string   "articul"
    t.integer  "length"
    t.integer  "width"
    t.integer  "height"
    t.float    "position"
    t.integer  "campaign"
    t.float    "weight"
    t.string   "side"
    t.string   "bottom"
    t.integer  "static_load"
    t.integer  "dynamic_load"
    t.integer  "rack_load"
    t.integer  "inner_length"
    t.integer  "inner_width"
    t.integer  "inner_height"
    t.boolean  "cover"
    t.integer  "category_id"
    t.integer  "diameter"
    t.integer  "inner_diameter"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.text     "meta"
    t.integer  "min_price"
    t.boolean  "active",                 default: true
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "promo_units", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "link"
    t.text     "description"
    t.integer  "promo_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "active"
  end

  add_index "promo_units", ["promo_id"], name: "index_promo_units_on_promo_id", using: :btree

  create_table "promos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "related_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "related_product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comparison_items", "comparisons"
  add_foreign_key "comparison_items", "products"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "product_photos", "products"
  add_foreign_key "promo_units", "promos"
end
