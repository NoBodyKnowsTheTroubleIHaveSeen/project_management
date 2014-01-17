class CreatePeople < ActiveRecord::Migration
  def change
  create_table "people", force: true do |t|
    t.integer "no"
    t.string  "name",                   null: false
    t.string  "gender",       limit: 10, null: false
    t.integer "departmentId"
    t.integer "projectId",              null: false
  end
  end
end
