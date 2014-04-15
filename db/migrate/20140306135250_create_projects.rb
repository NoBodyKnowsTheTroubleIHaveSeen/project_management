class CreateProjects < ActiveRecord::Migration
  def change

    create_table "projects", force: true do |t|
      t.string "name", null: false
      t.string "description", limit: 1000
      t.date "start_date", null: false
      t.date "finish_date"
      t.integer "finish_percentage", limit: 1
      t.integer "manager_id", null: false
      t.integer "is_done", limit: 1, default: 0, null: false
    end

    add_index "projects", ["manager_id"], name: "fk8", using: :btree

  end
end
