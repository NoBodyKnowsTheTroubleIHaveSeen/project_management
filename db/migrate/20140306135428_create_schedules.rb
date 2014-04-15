class CreateSchedules < ActiveRecord::Migration
  def change
    create_table "schedules", force: true do |t|
      t.integer "people_id",           null: false
      t.integer "task_id"
      t.integer "plan_id"
      t.date    "date"
      t.integer "complete_percentage"
      t.string  "description"
      t.string  "content",             null: false
    end

    add_index "schedules", ["people_id"], name: "fk10", using: :btree
    add_index "schedules", ["plan_id"], name: "fk12", using: :btree
    add_index "schedules", ["task_id"], name: "fk11", using: :btree

  end
end
