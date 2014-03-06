class CreateQuestions < ActiveRecord::Migration
  def change
    create_table "questions", force: true do |t|
      t.integer "people_id",   null: false
      t.string  "title",       null: false
      t.string  "content",     null: false
      t.date    "create_date", null: false
    end

    add_index "questions", ["people_id"], name: "fk9", using: :btree

  end
end
