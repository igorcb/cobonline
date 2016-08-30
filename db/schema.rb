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

ActiveRecord::Schema.define(version: 20160830203328) do

  create_table "advances", force: :cascade do |t|
    t.integer  "client_id"
    t.date     "date_advance",                         null: false
    t.decimal  "price",        precision: 9, scale: 2, null: false
    t.decimal  "balance",      precision: 9, scale: 2, null: false
    t.decimal  "percent",      precision: 9, scale: 2, null: false
    t.integer  "number_parts",                         null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "advances", ["client_id"], name: "index_advances_on_client_id"
  add_index "advances", ["date_advance"], name: "index_advances_on_date_advance"

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cities", ["name"], name: "index_cities_on_name", unique: true

  create_table "clients", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name",       limit: 100, null: false
    t.string   "fone",       limit: 20,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "clients", ["city_id"], name: "index_clients_on_city_id"

  create_table "holidays", force: :cascade do |t|
    t.string   "name",         null: false
    t.date     "date_holiday", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "holidays", ["date_holiday"], name: "index_holidays_on_date_holiday", unique: true

  create_table "item_advances", force: :cascade do |t|
    t.integer  "advance_id"
    t.string   "parts"
    t.date     "due_date",                              null: false
    t.decimal  "price",         precision: 9, scale: 2, null: false
    t.date     "date_payment"
    t.decimal  "valor_payment"
    t.decimal  "dalay",         precision: 9, scale: 2, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "item_advances", ["advance_id"], name: "index_item_advances_on_advance_id"

end
