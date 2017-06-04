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

ActiveRecord::Schema.define(version: 20170604232142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batch_items", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "batch"
    t.integer  "quantity"
    t.datetime "exp_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_batch_items", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "batch_item_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bill_batch_items", ["batch_item_id"], name: "index_bill_batch_items_on_batch_item_id", using: :btree
  add_index "bill_batch_items", ["bill_id"], name: "index_bill_batch_items_on_bill_id", using: :btree

  create_table "bills", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "order_id"
    t.integer  "user_id"
    t.datetime "due_date"
    t.boolean  "past_due"
    t.integer  "past_due_days"
    t.string   "status"
    t.integer  "total_due"
    t.string   "payment_form"
    t.string   "bill_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "bills", ["client_id"], name: "index_bills_on_client_id", using: :btree
  add_index "bills", ["order_id"], name: "index_bills_on_order_id", using: :btree
  add_index "bills", ["user_id"], name: "index_bills_on_user_id", using: :btree

  create_table "client_contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "position"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "client_contacts", ["client_id"], name: "index_client_contacts_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "business_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "main_contact_id"
    t.string   "nit",             default: "", null: false
    t.string   "city"
    t.string   "payment_form"
    t.integer  "deadline_days"
  end

  create_table "items", force: :cascade do |t|
    t.string   "CUM",                                  default: "n/a",                 null: false
    t.string   "ref",                                  default: "n/a",                 null: false
    t.string   "name",                                 default: "n/a",                 null: false
    t.string   "lab",                                  default: "n/a",                 null: false
    t.datetime "exp_date",                             default: '2017-05-29 00:35:03', null: false
    t.string   "presentation",                         default: "n/a",                 null: false
    t.datetime "created_at",                                                           null: false
    t.datetime "updated_at",                                                           null: false
    t.decimal  "price",        precision: 8, scale: 2
    t.boolean  "vat",                                  default: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_number"
    t.datetime "entry_date"
    t.string   "status"
    t.string   "observations"
    t.integer  "user_id"
    t.integer  "auth_user_id"
    t.datetime "dispatch_date"
    t.integer  "client_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bill_batch_items", "batch_items"
  add_foreign_key "bill_batch_items", "bills"
  add_foreign_key "bills", "clients"
  add_foreign_key "bills", "orders"
  add_foreign_key "bills", "users"
  add_foreign_key "client_contacts", "clients"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "users"
end
