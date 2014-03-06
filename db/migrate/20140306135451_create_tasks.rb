class CreateTasks < ActiveRecord::Migration
  def change
    create_table "tasks", force: true do |t|
      t.integer "project_id",               null: false
      t.string  "name",                     null: false
      t.string  "description", limit: 1000
      t.integer "percentage",  limit: 1,    null: false
      t.integer "weight",      limit: 1,    null: false
      t.date    "start_date",               null: false
      t.date    "end_date"
    end

    add_index "tasks", ["project_id"], name: "fk", using: :btree

  end
end
