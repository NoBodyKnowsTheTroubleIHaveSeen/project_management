class CreateAnswers < ActiveRecord::Migration
  def change
    create_table "answers", force: true do |t|
      t.integer "people_id",   null: false
      t.string  "content",     null: false
      t.date    "answer_date", null: false
    end

    add_index "answers", ["people_id"], name: "fk1", using: :btree
  end
end
