class CreatePersonTasks < ActiveRecord::Migration
  def change
    create_table "person_tasks", force: true do |t|
      t.integer "people_id", null: false
      t.integer "project_id", null: false
      t.integer "task_id", null: false
      t.integer "hard_level", limit: 1, null: false
      t.date "start_time", null: false
      t.date "finish_time"
      t.integer "is_doned", limit: 1, default: 0, null: false
    end

    add_index "person_tasks", ["people_id"], name: "fk4", using: :btree
    add_index "person_tasks", ["project_id"], name: "fk5", using: :btree
  end
end
