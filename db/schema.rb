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

ActiveRecord::Schema.define(version: 20140415025151) do

  create_table "answers", force: true do |t|
    t.integer "people_id",   null: false
    t.string  "content",     null: false
    t.date    "answer_date", null: false
    t.integer "question_id"
  end

  add_index "answers", ["people_id"], name: "fk1", using: :btree

  create_table "notices", force: true do |t|
    t.date     "date",       null: false
    t.integer  "people_id",  null: false
    t.string   "title",      null: false
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.integer "no"
    t.string  "name",                                 null: false
    t.string  "gender",        limit: 10,             null: false
    t.integer "department_id"
    t.string  "password",                             null: false
    t.string  "email",                                null: false
    t.integer "priviliege",               default: 0, null: false
  end

  create_table "person_projects", force: true do |t|
    t.integer "project_id",           null: false
    t.integer "people_id",            null: false
    t.integer "role",       limit: 1, null: false
    t.string  "role_name",            null: false
  end

  add_index "person_projects", ["people_id"], name: "fk2", using: :btree
  add_index "person_projects", ["project_id"], name: "fk3", using: :btree

  create_table "person_tasks", force: true do |t|
    t.integer "people_id",                         null: false
    t.integer "project_id",                        null: false
    t.integer "task_id",                           null: false
    t.date    "start_time",                        null: false
    t.date    "finish_time"
    t.integer "is_done",    limit: 1, default: 0, null: false
  end

  add_index "person_tasks", ["people_id"], name: "fk4", using: :btree
  add_index "person_tasks", ["project_id"], name: "fk5", using: :btree

  create_table "plans", force: true do |t|
    t.integer "people_id",             null: false
    t.integer "task_id"
    t.string  "name"
    t.string  "description"
    t.integer "hard_level",  limit: 1, null: false
    t.date    "create_date",           null: false
    t.date    "start_date"
    t.date    "finish_date"
    t.integer "is_done"
  end

  add_index "plans", ["people_id"], name: "fk6", using: :btree
  add_index "plans", ["task_id"], name: "fk7", using: :btree

  create_table "projects", force: true do |t|
    t.string  "name",                                       null: false
    t.string  "description",       limit: 1000
    t.date    "start_date",                                 null: false
    t.date    "finish_date"
    t.integer "finish_percentage", limit: 1
    t.integer "manager_id",                                 null: false
    t.integer "is_done",          limit: 1,    default: 0, null: false
  end

  add_index "projects", ["manager_id"], name: "fk8", using: :btree

  create_table "questions", force: true do |t|
    t.integer "people_id",   null: false
    t.string  "title",       null: false
    t.string  "content",     null: false
    t.date    "create_date", null: false
  end

  add_index "questions", ["people_id"], name: "fk9", using: :btree

  create_table "schedules", force: true do |t|
    t.integer "people_id",           null: false
    t.integer "task_id"
    t.integer "plan_id"
    t.date    "date"
    t.integer "complete_percentage"
    t.string  "description"
    t.string  "content",             null: false
    t.integer "plan_is_done"
  end

  add_index "schedules", ["people_id"], name: "fk10", using: :btree
  add_index "schedules", ["plan_id"], name: "fk12", using: :btree
  add_index "schedules", ["task_id"], name: "fk11", using: :btree

  create_table "shares", force: true do |t|
    t.integer "people_id",   null: false
    t.string  "name",        null: false
    t.string  "path",        null: false
    t.date    "upload_date", null: false
  end

  add_index "shares", ["people_id"], name: "fk13", using: :btree

  create_table "tasks", force: true do |t|
    t.integer "project_id",                           null: false
    t.string  "name",                                 null: false
    t.string  "description", limit: 1000
    t.integer "percentage",  limit: 1,    default: 0, null: false
    t.integer "weight",      limit: 1,                null: false
    t.date    "start_date",                           null: false
    t.date    "end_date"
    t.integer "hard_level"
  end

  add_index "tasks", ["project_id"], name: "fk", using: :btree

end
