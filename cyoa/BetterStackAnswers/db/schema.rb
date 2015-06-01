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

ActiveRecord::Schema.define(version: 20150601190104) do

  create_table "answers", force: :cascade do |t|
    t.integer  "answer_id"
    t.integer  "question_id"
    t.boolean  "is_accepted"
    t.integer  "up_vote_count"
    t.date     "creation_date"
    t.string   "link"
    t.date     "last_edit_date"
    t.text     "body"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "tags"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "accepted_answer_id"
    t.text     "body"
    t.date     "creation_date"
    t.string   "tags"
    t.text     "title"
    t.integer  "up_vote_count"
    t.integer  "answer_count"
    t.boolean  "is_answered"
    t.text     "link"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
