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

ActiveRecord::Schema.define(version: 20130705163347) do

  create_table "sale_items", force: true do |t|
    t.integer  "sale_id"
    t.string   "purchaser_name",                            null: false
    t.string   "item_description",                          null: false
    t.decimal  "item_price",       precision: 10, scale: 2, null: false
    t.integer  "purchase_count",                            null: false
    t.string   "merchant_address",                          null: false
    t.string   "merchant_name",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sale_items", ["sale_id"], name: "index_sale_items_on_sale_id"

  create_table "sales", force: true do |t|
    t.string   "transaction_key", limit: 32,                          null: false
    t.decimal  "total_price",                precision: 12, scale: 2, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["transaction_key"], name: "index_sales_on_transaction_key", unique: true

end
