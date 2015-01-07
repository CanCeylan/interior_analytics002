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

ActiveRecord::Schema.define(version: 20150107091947) do

  create_table "locations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "city",       limit: 255
    t.string   "address",    limit: 255
    t.text     "bounds",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "mac_id",     limit: 255
    t.string   "reason",     limit: 255
    t.string   "hierarchy",  limit: 255
    t.integer  "mapX",       limit: 4
    t.integer  "mapY",       limit: 4
    t.datetime "firstTime"
    t.datetime "lastTime"
    t.datetime "serverTime"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "location",   limit: 4
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "mac_id",           limit: 255
    t.string   "ip_address",       limit: 255
    t.datetime "firstLocatedTime"
    t.integer  "at_location",      limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "length",      limit: 4
    t.integer  "visitor_id",  limit: 4
    t.integer  "location_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "visits", ["location_id"], name: "index_visits_on_location_id", using: :btree
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id", using: :btree

  add_foreign_key "visits", "locations"
  add_foreign_key "visits", "visitors"
end
