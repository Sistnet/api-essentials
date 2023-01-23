# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_10_133156) do
  create_table "group_policies", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type"], name: "index_group_policies_on_user_type"
  end

  create_table "group_policy_permissions", charset: "utf8", force: :cascade do |t|
    t.bigint "permission_id", null: false
    t.bigint "group_policy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_policy_id"], name: "index_group_policy_permissions_on_group_policy_id"
    t.index ["permission_id"], name: "index_group_policy_permissions_on_permission_id"
  end

  create_table "permissions", charset: "utf8", force: :cascade do |t|
    t.string "resource", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource"], name: "index_permissions_on_resource"
  end

  create_table "user_login_logs", charset: "utf8", force: :cascade do |t|
    t.datetime "last_login_at"
    t.string "email"
    t.string "user_agent"
    t.string "ip_address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_login_logs_on_user_id"
  end

  create_table "user_permissions", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_user_permissions_on_permission_id"
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "first_name", limit: 100, null: false
    t.string "last_name", limit: 100, null: false
    t.string "email", limit: 200, null: false
    t.string "user_type", limit: 100, null: false
    t.integer "status", default: 0, null: false
    t.string "password_digest", null: false
    t.string "password_reset_token"
    t.string "avatar"
    t.string "phone"
    t.datetime "password_token_expiry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "group_policy_permissions", "group_policies"
  add_foreign_key "group_policy_permissions", "permissions"
  add_foreign_key "user_login_logs", "users"
  add_foreign_key "user_permissions", "permissions"
  add_foreign_key "user_permissions", "users"
end
