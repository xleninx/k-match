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

ActiveRecord::Schema.define(version: 20140430082544) do

  create_table "clubs", force: true do |t|
    t.string "name"
    t.string "type_club"
  end

  create_table "clubs_users", force: true do |t|
    t.integer "user_id"
    t.integer "club_id"
  end

  create_table "connections", force: true do |t|
    t.integer  "current_id"
    t.integer  "prospective_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
  end

  create_table "countries", force: true do |t|
    t.string "code"
    t.string "name"
  end

  create_table "functions", force: true do |t|
    t.string "name"
  end

  create_table "homes", force: true do |t|
  end

  create_table "industries", force: true do |t|
    t.string "name"
  end

  create_table "matches", force: true do |t|
    t.integer "match_index"
    t.integer "user_id"
  end

  create_table "programs", force: true do |t|
    t.string "name"
  end

  create_table "programs_users", force: true do |t|
    t.integer "program_id"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_rights"
    t.integer  "country_id"
    t.integer  "grad_year"
    t.integer  "contact_count"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.integer  "current_industry_id"
    t.integer  "interest_industry_id"
    t.integer  "current_function_id"
    t.integer  "interest_function_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
