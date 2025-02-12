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

ActiveRecord::Schema[7.0].define(version: 2025_02_12_081631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "officers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "office_id"
    t.bigint "vehicle_id"
    t.index ["office_id"], name: "index_officers_on_office_id"
    t.index ["vehicle_id"], name: "index_officers_on_vehicle_id"
  end

  create_table "offices", force: :cascade do |t|
    t.string "name"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rank_officers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "officer_id", null: false
    t.bigint "rank_id", null: false
    t.index ["officer_id"], name: "index_rank_officers_on_officer_id"
    t.index ["rank_id"], name: "index_rank_officers_on_rank_id"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "fuel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "officers", "offices"
  add_foreign_key "officers", "vehicles"
  add_foreign_key "rank_officers", "officers"
  add_foreign_key "rank_officers", "ranks"
end
