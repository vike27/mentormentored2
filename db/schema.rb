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

ActiveRecord::Schema.define(version: 20140921164012) do

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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_uid"
    t.string   "image_name"
    t.text     "twitter"
    t.boolean  "monday"
    t.text     "mondaytime1"
    t.text     "mondaytime2"
    t.boolean  "tuesday"
    t.text     "tuesdaytime1"
    t.text     "tuesdaytime2"
    t.boolean  "wednesday"
    t.text     "wednesdaytime1"
    t.text     "wednesdaytime2"
    t.boolean  "thursday"
    t.text     "thursdaytime1"
    t.text     "thursdaytime2"
    t.boolean  "friday"
    t.text     "fridaytime1"
    t.text     "fridaytime2"
    t.boolean  "saturday"
    t.text     "saturdaytime1"
    t.text     "saturdaytime2"
    t.boolean  "sunday"
    t.text     "sundaytime1"
    t.text     "sundaytime2"
    t.string   "job_title"
    t.string   "industry"
    t.string   "location"
    t.string   "occupation"
    t.string   "gender"
    t.string   "work_history"
    t.decimal  "years_of_experience"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true


end
