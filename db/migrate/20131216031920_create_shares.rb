class CreateShares < ActiveRecord::Migration
  def change
   create_table "shares", force: true do |t|
    t.integer "peopleId",  null: false
    t.date    "shareDate", null: false
    t.string  "shareURL",  null: false
  end
  end
end
