class CreateTasks < ActiveRecord::Migration
  def change
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
end
