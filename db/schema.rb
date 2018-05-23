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

ActiveRecord::Schema.define(version: 20160522231736) do

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.text "description"
  end

  create_table "questions_results", id: false, force: :cascade do |t|
    t.integer "question_id"
    t.integer "result_id"
  end

  add_index "questions_results", ["question_id"], name: "index_questions_results_on_question_id"
  add_index "questions_results", ["result_id"], name: "index_questions_results_on_result_id"

  create_table "results", force: :cascade do |t|
    t.text     "name"
    t.integer  "age"
    t.integer  "rect"
    t.integer  "circle"
    t.integer  "triangle"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "subtype_id",         null: false
  end

  add_index "results", ["subtype_id"], name: "index_results_on_subtype_id"

  create_table "subtypes", force: :cascade do |t|
    t.text    "description"
    t.integer "value"
    t.integer "type_id",     null: false
  end

  add_index "subtypes", ["type_id"], name: "index_subtypes_on_type_id"

  create_table "types", force: :cascade do |t|
    t.text    "name"
    t.integer "value"
    t.text    "description"
    t.text    "relationship"
    t.text    "expert_opinion"
    t.text    "general_status"
    t.text    "self_description"
    t.text    "short_description"
  end

  create_table "types_subtypes", id: false, force: :cascade do |t|
    t.integer "type_id",    null: false
    t.integer "subtype_id", null: false
  end

  add_index "types_subtypes", ["subtype_id"], name: "index_types_subtypes_on_subtype_id"
  add_index "types_subtypes", ["type_id"], name: "index_types_subtypes_on_type_id"

end
