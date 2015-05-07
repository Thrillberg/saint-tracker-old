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

ActiveRecord::Schema.define(version: 20150507130853) do

  create_table "artist_saints", force: true do |t|
    t.integer "artist_id"
    t.integer "saint_id"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "dates"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "saints", force: true do |t|
    t.string   "name"
    t.string   "is_saint_of"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "role"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_saints", force: true do |t|
    t.integer "work_id"
    t.integer "saint_id"
  end

  create_table "works", force: true do |t|
    t.string   "title"
    t.string   "date"
    t.string   "city"
    t.string   "slug"
    t.integer  "artist_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.float    "latitude"
    t.float    "longitude"
  end

end
