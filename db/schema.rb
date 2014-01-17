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

ActiveRecord::Schema.define(version: 20140112070249) do

  create_table "people", force: true do |t|
    t.integer "no"
    t.string  "name",                   null: false
    t.string  "gender",       limit: 10, null: false
    t.integer "departmentId"
    t.integer "projectId",              null: false
    t.string  "password",               null: false
  end

  create_table "person_projects", force: true do |t|
    t.integer "projectId",           null: false
    t.integer "peopleId",            null: false
    t.integer "role",      limit: 1, null: false
    t.string  "roleName",            null: false
  end

  create_table "projects", force: true do |t|
    t.string  "name",                     null: false
    t.string  "description", limit: 1000
    t.date    "startDate",                null: false
    t.integer "managerId",                null: false
  end

  create_table "shares", force: true do |t|
    t.integer "peopleId",  null: false
    t.date    "shareDate", null: false
    t.string  "shareURL",  null: false
  end

  create_table "task_details", force: true do |t|
    t.integer "taskId",    null: false
    t.string  "question"
    t.string  "work"
    t.string  "scheduled"
    t.date    "startDate"
  end

  create_table "tasks", force: true do |t|
    t.integer "peopleId",                 null: false
    t.string  "name",                     null: false
    t.string  "description", limit: 1000
    t.integer "percentage",  limit: 1,    null: false
    t.integer "weight",      limit: 1,    null: false
    t.date    "startDate",                null: false
    t.date    "endDate"
  end

end
