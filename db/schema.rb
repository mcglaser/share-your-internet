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

ActiveRecord::Schema.define(version: 20170124225314) do

  create_table "addresses", force: :cascade do |t|
    t.string  "address_line_one"
    t.string  "address_line_two"
    t.string  "city"
    t.string  "state"
    t.string  "country"
    t.integer "postal_code"
    t.integer "user_id"
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id"

  create_table "details", force: :cascade do |t|
    t.boolean "pays_for_internet"
    t.boolean "lives_in_community"
    t.integer "user_id"
  end

  add_index "details", ["user_id"], name: "index_details_on_user_id"

  create_table "employees", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.integer "uid",   limit: 8
  end

  create_table "followups", force: :cascade do |t|
    t.string  "internet_type"
    t.string  "internet_speed"
    t.integer "monthly_cost"
    t.string  "community_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.boolean  "pays_for_internet"
    t.boolean  "lives_in_community"
    t.string   "internet_type"
    t.string   "internet_speed"
    t.decimal  "monthly_cost",       precision: 8, scale: 2
    t.string   "community_name"
    t.boolean  "admin",                                      default: false
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

end
