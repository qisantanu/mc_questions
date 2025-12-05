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

ActiveRecord::Schema[8.1].define(version: 3) do
  create_table "questions", force: :cascade do |t|
    t.text "content", null: false
    t.json "correct_options", null: false
    t.datetime "created_at", null: false
    t.string "option_a", null: false
    t.string "option_b", null: false
    t.string "option_c"
    t.string "option_d"
    t.datetime "updated_at", null: false
  end

  create_table "student_answers", force: :cascade do |t|
    t.boolean "correct", null: false
    t.datetime "created_at", null: false
    t.integer "question_id", null: false
    t.json "selected_options", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["question_id"], name: "index_student_answers_on_question_id"
    t.index ["user_id", "question_id"], name: "index_student_answers_on_user_id_and_question_id", unique: true
    t.index ["user_id"], name: "index_student_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "role", default: "student", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "student_answers", "questions"
  add_foreign_key "student_answers", "users"
end
