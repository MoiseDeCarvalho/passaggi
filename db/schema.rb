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

ActiveRecord::Schema.define(version: 2020_10_07_203303) do

  create_table "feedback_paths", force: :cascade do |t|
    t.integer "user_id"
    t.integer "path_offer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "booked"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer "path_offer_id"
    t.integer "user_id"
    t.text "feedback"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.string "dest_user_id"
    t.string "title"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "path_offer_id"
    t.string "sender_name"
    t.string "receiver_name"
    t.integer "read"
  end

  create_table "path_offers", force: :cascade do |t|
    t.integer "vehicle_id"
    t.integer "user_id"
    t.string "departure"
    t.string "arrive"
    t.datetime "date_departure"
    t.datetime "date_arrive"
    t.float "price"
    t.integer "max_available"
    t.integer "booked"
    t.integer "full"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "place"
    t.string "data_partenza"
    t.string "ora_partenza"
    t.string "data_arrivo"
    t.string "ora_arrivo"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation"
    t.integer "music"
    t.integer "smoke"
    t.integer "animal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "address"
    t.string "city"
    t.string "mobile"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "scores", force: :cascade do |t|
    t.string "user_id"
    t.float "score"
    t.integer "count"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "t1s", force: :cascade do |t|
    t.datetime "tep"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ts", force: :cascade do |t|
    t.time "tep"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "a"
  end

  create_table "type_vehicles", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.integer "active", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "type_vehicle_id"
    t.string "brand"
    t.string "model"
    t.string "motor"
    t.string "colour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_1_file_name"
    t.string "photo_1_content_type"
    t.integer "photo_1_file_size"
    t.datetime "photo_1_updated_at"
    t.string "photo_2_file_name"
    t.string "photo_2_content_type"
    t.integer "photo_2_file_size"
    t.datetime "photo_2_updated_at"
  end

end
