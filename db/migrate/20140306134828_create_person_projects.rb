class CreatePersonProjects < ActiveRecord::Migration
  def change
    create_table "person_projects", force: true do |t|
      t.integer "project_id",           null: false
      t.integer "people_id",            null: false
      t.integer "role",       limit: 1, null: false
      t.string  "role_name",            null: false
    end

    add_index "person_projects", ["people_id"], name: "fk2", using: :btree
    add_index "person_projects", ["project_id"], name: "fk3", using: :btree
  end
end
