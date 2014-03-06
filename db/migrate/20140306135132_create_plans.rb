class CreatePlans < ActiveRecord::Migration
  def change
    create_table "plans", force: true do |t|
      t.integer "people_id",             null: false
      t.integer "task_id"
      t.string  "name"
      t.string  "description"
      t.integer "hard_level",  limit: 1, null: false
      t.date    "create_date",           null: false
      t.date    "start_date"
      t.date    "finish_date"
    end

    add_index "plans", ["people_id"], name: "fk6", using: :btree
    add_index "plans", ["task_id"], name: "fk7", using: :btree
  end
end
