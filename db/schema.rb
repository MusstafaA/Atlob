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

ActiveRecord::Schema.define(version: 20160421123239) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "friend_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groups", ["user_id"], name: "index_groups_on_user_id", using: :btree

  create_table "inviteds", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "order_id", limit: 4
  end

  add_index "inviteds", ["order_id"], name: "index_inviteds_on_order_id", using: :btree
  add_index "inviteds", ["user_id"], name: "index_inviteds_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id",    limit: 4
    t.integer  "actor_id",        limit: 4
    t.datetime "read_at"
    t.string   "action",          limit: 255
    t.integer  "notifiable_id",   limit: 4
    t.string   "notifiable_type", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "for",        limit: 255
    t.string   "res_name",   limit: 255
    t.string   "avatar",     limit: 255
    t.string   "status",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ordetails", force: :cascade do |t|
    t.string   "item",       limit: 255
    t.float    "price",      limit: 24
    t.integer  "amount",     limit: 4
    t.text     "comment",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ordetails", ["order_id"], name: "index_ordetails_on_order_id", using: :btree
  add_index "ordetails", ["user_id"], name: "index_ordetails_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255,              null: false
    t.string   "avatar",                 limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "usgroups", force: :cascade do |t|
    t.integer "user_id",  limit: 4
    t.integer "group_id", limit: 4
  end

  add_index "usgroups", ["group_id"], name: "index_usgroups_on_group_id", using: :btree
  add_index "usgroups", ["user_id"], name: "index_usgroups_on_user_id", using: :btree

  add_foreign_key "groups", "users"
  add_foreign_key "inviteds", "orders"
  add_foreign_key "inviteds", "users"
  add_foreign_key "ordetails", "orders"
  add_foreign_key "ordetails", "users"
  add_foreign_key "usgroups", "groups"
  add_foreign_key "usgroups", "users"
end
