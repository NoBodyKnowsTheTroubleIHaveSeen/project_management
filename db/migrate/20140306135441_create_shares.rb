class CreateShares < ActiveRecord::Migration
  def change
    create_table "shares", force: true do |t|
      t.integer "people_id", null: false
      t.string "name", null: false
      t.string "path", null: false
    end

    add_index "shares", ["people_id"], name: "fk13", using: :btree

  end
end
