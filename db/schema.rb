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

ActiveRecord::Schema.define(version: 20150614094454) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activeadmin_settings_pictures", force: :cascade do |t|
    t.string   "data"
    t.string   "data_file_size"
    t.string   "data_content_type"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activeadmin_settings_settings", force: :cascade do |t|
    t.string   "name"
    t.text     "string"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "calc_items", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.integer  "position"
  end

  add_index "calc_items", ["ancestry"], name: "index_calc_items_on_ancestry", using: :btree
  add_index "calc_items", ["position"], name: "index_calc_items_on_position", using: :btree

  create_table "call_requests", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "position"
    t.string   "ancestry"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  add_index "categories", ["name"], name: "index_categories_on_name", using: :btree
  add_index "categories", ["position"], name: "index_categories_on_position", using: :btree

  create_table "param_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position"
  end

  add_index "param_types", ["category_id"], name: "index_param_types_on_category_id", using: :btree
  add_index "param_types", ["position"], name: "index_param_types_on_position", using: :btree

  create_table "param_values", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "position"
    t.integer  "param_type_id"
    t.string   "color"
  end

  add_index "param_values", ["param_type_id"], name: "index_param_values_on_param_type_id", using: :btree
  add_index "param_values", ["position"], name: "index_param_values_on_position", using: :btree

  create_table "params", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "params", ["category_id"], name: "index_params_on_category_id", using: :btree

  create_table "product_params", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "param_type_id"
    t.integer  "param_value_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "product_params", ["param_type_id"], name: "index_product_params_on_param_type_id", using: :btree
  add_index "product_params", ["param_value_id"], name: "index_product_params_on_param_value_id", using: :btree
  add_index "product_params", ["product_id"], name: "index_product_params_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "vendor_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "units"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree
  add_index "products", ["units"], name: "index_products_on_units", using: :btree
  add_index "products", ["vendor_id"], name: "index_products_on_vendor_id", using: :btree

  create_table "project_images", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "project_images", ["project_id"], name: "index_project_images_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "address"
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vendors", ["name"], name: "index_vendors_on_name", using: :btree

  add_foreign_key "param_types", "categories"
  add_foreign_key "param_values", "param_types"
  add_foreign_key "params", "categories"
  add_foreign_key "product_params", "param_types"
  add_foreign_key "product_params", "param_values"
  add_foreign_key "product_params", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "vendors"
  add_foreign_key "project_images", "projects"
end
