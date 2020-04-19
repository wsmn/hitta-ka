# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_18_134211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "slug"
    t.jsonb "address", default: "{}", null: false
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude"], name: "index_companies_on_latitude"
    t.index ["longitude"], name: "index_companies_on_longitude"
    t.index ["name"], name: "index_companies_on_name"
    t.index ["slug"], name: "index_companies_on_slug", unique: true
  end

  create_table "csp_reports", force: :cascade do |t|
    t.string "blocked_uri"
    t.string "disposition"
    t.string "document_uri"
    t.string "effective_directive"
    t.string "violated_directive"
    t.string "referrer"
    t.integer "status_code"
    t.jsonb "raw_report"
    t.string "raw_browser"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "organisation_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "address", default: {}, null: false
    t.jsonb "contact_information", default: {}, null: false
    t.string "phone"
    t.string "email"
    t.jsonb "settings", default: {}, null: false
    t.index ["organisation_id"], name: "index_customers_on_organisation_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.date "invoice_date", default: -> { "CURRENT_DATE" }, null: false
    t.date "due_date"
    t.string "invoice_nbr"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
  end

  create_table "organisation_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "organisation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organisation_id"], name: "index_organisation_users_on_organisation_id"
    t.index ["user_id", "organisation_id"], name: "index_organisation_users_on_user_id_and_organisation_id", unique: true
    t.index ["user_id"], name: "index_organisation_users_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["customer_id"], name: "index_projects_on_customer_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "title", null: false
    t.text "description", default: "", null: false
    t.integer "status", default: 0, null: false
    t.float "hours", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "invoice_id"
    t.jsonb "settings", default: {}, null: false
    t.date "task_date"
    t.index ["invoice_id"], name: "index_tasks_on_invoice_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "name", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "customers", "organisations"
  add_foreign_key "invoices", "customers"
  add_foreign_key "organisation_users", "organisations"
  add_foreign_key "organisation_users", "users"
  add_foreign_key "projects", "customers"
  add_foreign_key "tasks", "invoices"
  add_foreign_key "tasks", "projects"
end
