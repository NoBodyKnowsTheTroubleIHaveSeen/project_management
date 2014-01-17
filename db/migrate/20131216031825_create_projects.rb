class CreateProjects < ActiveRecord::Migration
  def change
    create_table "projects", force: true do |t|
    t.string  "name",                     null: false
    t.string  "description", limit: 1000
    t.date    "startDate",                null: false
    t.integer "managerId",                null: false
  end
  end
end
