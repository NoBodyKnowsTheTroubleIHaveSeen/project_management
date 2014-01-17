class CreatePersonProjects < ActiveRecord::Migration
  def change
  create_table "person_projects", force: true do |t|
    t.integer "projectId",           null: false
    t.integer "peopleId",            null: false
    t.integer "role",      limit: 1, null: false
    t.string  "roleName",            null: false
  end
  end
end
