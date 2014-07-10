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

ActiveRecord::Schema.define(version: 20140710185000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_id"
    t.integer  "user_id"
  end

  create_table "languages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "message_id"
    t.boolean  "read",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "about"
    t.date     "closing_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buyer_id"
  end

  create_table "proposals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "creative_id"
    t.string   "title"
    t.text     "description"
    t.text     "about"
    t.integer  "status"
  end

  create_table "requisite_skills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_id"
    t.integer  "project_id"
  end

  create_table "skills", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "user_languages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "language_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "type"
    t.date     "birthday"
    t.string   "location"
    t.text     "about"
    t.string   "avatar"
    t.string   "balanced_card_uri"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
