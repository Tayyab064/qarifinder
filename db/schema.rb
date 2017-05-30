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

ActiveRecord::Schema.define(version: 20170530105448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "place"
    t.datetime "timing"
    t.string   "title"
    t.string   "orginazior"
    t.string   "contact_number"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "description",    default: ""
    t.string   "image"
  end

  create_table "qaris", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "mobile_number"
    t.string   "token"
    t.string   "password_reset_token"
    t.string   "address"
    t.datetime "dob"
    t.integer  "gender"
    t.string   "qualification"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.float    "hourly_rate",          default: 0.0
    t.string   "awards",               default: ""
    t.string   "image"
    t.string   "experience"
    t.boolean  "email_verified",       default: false
    t.string   "email_token"
  end

  create_table "timeslots", force: :cascade do |t|
    t.string   "timeslot"
    t.string   "dayslot"
    t.integer  "qari_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qari_id"], name: "index_timeslots_on_qari_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "mobile_number"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.string   "password_reset_token"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image"
  end

end
