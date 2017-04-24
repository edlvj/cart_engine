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

ActiveRecord::Schema.define(version: 20170424170103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_engine_addresses", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.integer  "order_id"
    t.integer  "user_id"
    t.string   "addressable_type"
    t.integer  "country_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "cart_engine_countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_engine_coupons", force: :cascade do |t|
    t.integer  "discount"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.index ["code"], name: "index_cart_engine_coupons_on_code", using: :btree
    t.index ["order_id"], name: "index_cart_engine_coupons_on_order_id", using: :btree
  end

  create_table "cart_engine_credit_cards", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "cvv"
    t.integer  "user_id"
    t.string   "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "order_id"
    t.index ["user_id"], name: "index_cart_engine_credit_cards_on_user_id", using: :btree
  end

  create_table "cart_engine_order_items", force: :cascade do |t|
    t.integer  "qty"
    t.string   "productable_type"
    t.integer  "productable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "order_id"
    t.decimal  "price"
    t.index ["order_id"], name: "index_cart_engine_order_items_on_order_id", using: :btree
    t.index ["productable_type", "productable_id"], name: "index_engine_productable", using: :btree
  end

  create_table "cart_engine_orders", force: :cascade do |t|
    t.decimal  "total_price",    precision: 10, scale: 2
    t.integer  "user_id"
    t.integer  "shipping_id"
    t.string   "aasm_state"
    t.date     "confirmed_date"
    t.string   "credit_card_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "cart_engine_shippings", force: :cascade do |t|
    t.string   "company"
    t.string   "days"
    t.decimal  "costs",      default: "0.0"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "engine_products", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "engine_users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
