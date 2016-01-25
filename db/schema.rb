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

ActiveRecord::Schema.define(version: 20160125091333) do

  create_table "c4_preferences", force: :cascade do |t|
    t.text   "values",     default: "[]"
    t.text   "youtube"
    t.text   "facebook"
    t.text   "twitter"
    t.string "email"
    t.string "telephone"
    t.string "telephone2"
  end

  create_table "c4_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.integer  "role",                   default: 0
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
  end

  add_index "c4_users", ["email"], name: "index_c4_users_on_email", unique: true
  add_index "c4_users", ["reset_password_token"], name: "index_c4_users_on_reset_password_token", unique: true

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "teacher_id"
  end

  add_index "groups", ["teacher_id"], name: "index_groups_on_teacher_id"

  create_table "homework_uploads", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "homework_file_name"
    t.string   "homework_content_type"
    t.integer  "homework_file_size"
    t.datetime "homework_updated_at"
    t.integer  "group_id"
  end

  add_index "homework_uploads", ["group_id"], name: "index_homework_uploads_on_group_id"

end
