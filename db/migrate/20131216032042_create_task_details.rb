class CreateTaskDetails < ActiveRecord::Migration
  def change
  create_table "task_details", force: true do |t|
    t.integer "taskId",    null: false
    t.string  "question"
    t.string  "work"
    t.string  "scheduled"
    t.date    "startDate"
  end
  end
end
