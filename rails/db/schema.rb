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

ActiveRecord::Schema.define(version: 20140615200424) do

  create_table "data", force: true do |t|
    t.integer "timestamp"
    t.string  "source"
    t.string  "property"
    t.float   "value"
  end

  add_index "data", ["property"], name: "index_data_on_property", using: :btree
  add_index "data", ["source"], name: "index_data_on_source", using: :btree
  add_index "data", ["timestamp"], name: "index_data_on_timestamp", using: :btree

  create_table "rogrs", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.boolean  "water_pump_power"
    t.boolean  "nutrient_pump_power"
    t.float    "water_level"
    t.float    "nutrient_level"
    t.float    "battery_level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "docked"
  end

  create_table "spots", force: true do |t|
    t.string   "name"
    t.string   "key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "set_air_temp_high"
    t.float    "set_air_temp_low"
    t.float    "set_water_temp_high"
    t.float    "set_water_temp_low"
    t.float    "set_rh_high"
    t.float    "set_rh_low"
    t.float    "set_ec_high"
    t.float    "set_ec_low"
    t.float    "set_ph_high"
    t.float    "set_ph_low"
    t.float    "set_co2_high"
    t.float    "set_co2_low"
    t.string   "timezone"
    t.float    "air_temp"
    t.float    "water_temp"
    t.float    "rh"
    t.float    "ec"
    t.float    "ph"
    t.float    "co2"
    t.integer  "white_light_on"
    t.integer  "white_light_off"
    t.integer  "red_light_on"
    t.integer  "red_light_off"
    t.float    "do"
    t.float    "set_do_high"
    t.float    "set_do_low"
    t.boolean  "fans"
    t.boolean  "refresh"
    t.boolean  "white_light_power"
    t.boolean  "red_light_power"
    t.boolean  "enclosure"
    t.float    "h2o_level"
    t.float    "battery_level"
    t.date     "started_on"
    t.string   "planted_with"
    t.string   "note"
    t.integer  "pump_duration"
    t.integer  "pump_frequency"
  end

end
