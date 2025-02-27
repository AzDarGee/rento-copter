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

ActiveRecord::Schema.define(version: 20141203004124) do

  create_table "properties", force: :cascade do |t|
    t.string   "title",           limit: 255
    t.float    "rent"
    t.string   "address",         limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_rooms"
    t.integer  "num_bathrooms"
    t.integer  "num_accomodates"
    t.integer  "user_id"
    t.string   "type_prop",       limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.string   "role",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visitations", force: :cascade do |t|
    t.datetime "start_time"
    t.integer  "property_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_people",              default: 1
    t.string   "agent",       limit: 255
  end

  add_index "visitations", ["property_id"], name: "index_visitations_on_property_id"
  add_index "visitations", ["user_id"], name: "index_visitations_on_user_id"

end
