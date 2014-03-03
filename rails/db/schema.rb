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

ActiveRecord::Schema.define(version: 20140302045403) do

  create_table "data", force: true do |t|
    t.integer "timestamp"
    t.string  "source"
    t.string  "property"
    t.float   "value"
  end

  add_index "data", ["property"], name: "index_data_on_property", using: :btree
  add_index "data", ["source"], name: "index_data_on_source", using: :btree
  add_index "data", ["timestamp"], name: "index_data_on_timestamp", using: :btree

  create_table "spots", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
