class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.date :date,null:false
      t.integer :people_id,null:false
      t.string :title,null:false
      t.string :content,null:false

      t.timestamps
    end
  end
end
