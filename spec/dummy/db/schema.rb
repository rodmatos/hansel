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

ActiveRecord::Schema.define(version: 2019_02_27_123558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "humans", force: :cascade do |t|
    t.string "name"
  end

  create_table "records", force: :cascade do |t|
    t.json "fields", default: {}
    t.json "metadata", default: {}
    t.string "recordable_type"
    t.bigint "recordable_id"
    t.bigint "previous_record_id"
    t.datetime "created_at"
    t.index ["previous_record_id"], name: "index_records_on_previous_record_id"
    t.index ["recordable_type", "recordable_id"], name: "index_records_on_recordable_type_and_recordable_id"
  end

  add_foreign_key "records", "records", column: "previous_record_id"
end
