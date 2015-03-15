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

ActiveRecord::Schema.define(version: 20150315152251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string   "name"
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

  create_table "pages", force: :cascade do |t|
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
    t.text     "short_description"
    t.string   "gallery"
    t.string   "size"
    t.string   "size_with_cover"
    t.string   "cover_size"
    t.string   "capacity"
    t.integer  "volume"
    t.integer  "net_volume"
    t.string   "parameter"
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
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "keywords"
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
