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

ActiveRecord::Schema.define(version: 20150807090425) do

  create_table "customers", force: :cascade do |t|
    t.integer  "cid",                          limit: 4
    t.string   "name",                         limit: 255
    t.string   "id_number",                    limit: 255
    t.string   "birthday",                     limit: 255
    t.integer  "gender",                       limit: 4
    t.integer  "marriage",                     limit: 4
    t.string   "nationality",                  limit: 255
    t.string   "sub_nationality",              limit: 255
    t.string   "email",                        limit: 255
    t.integer  "doctor_id",                    limit: 4
    t.integer  "nurse_id",                     limit: 4
    t.string   "occupation",                   limit: 255
    t.string   "to_store_channel",             limit: 255
    t.string   "special_history",              limit: 255
    t.integer  "pregnant",                     limit: 4
    t.integer  "blood_type",                   limit: 4
    t.string   "operation_history",            limit: 255
    t.string   "drug_allergy",                 limit: 255
    t.integer  "medicine",                     limit: 4
    t.string   "beauty_therapy",               limit: 255
    t.string   "phototherapy",                 limit: 255
    t.string   "hyaluronic_acid",              limit: 255
    t.string   "microcrystalline_porcelain",   limit: 255
    t.string   "other_parts",                  limit: 255
    t.string   "plastic_part",                 limit: 255
    t.string   "skin",                         limit: 255
    t.string   "wrinkle",                      limit: 255
    t.string   "blood_vessel",                 limit: 255
    t.string   "pore",                         limit: 255
    t.string   "pigment",                      limit: 255
    t.string   "figure",                       limit: 255
    t.string   "other_info",                   limit: 255
    t.string   "picture_url",                  limit: 255
    t.string   "before_treatment_picture_url", limit: 255
    t.string   "after_treatment_picture_url",  limit: 255
    t.string   "phone",                        limit: 255
    t.integer  "consultant_id",                limit: 4
    t.integer  "channel_id",                   limit: 4
    t.string   "remarks",                      limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "operator_id",                  limit: 4
    t.string   "address",                      limit: 255
  end

  create_table "doctors", force: :cascade do |t|
    t.integer  "did",                limit: 4
    t.string   "name",               limit: 255
    t.string   "picture",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "nurses", force: :cascade do |t|
    t.integer  "nid",                limit: 4
    t.string   "name",               limit: 255
    t.string   "picture",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "resource_id",   limit: 4
    t.string   "resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "role_id", limit: 4
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
