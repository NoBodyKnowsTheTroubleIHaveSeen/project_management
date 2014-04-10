class AddUploadDateToShare < ActiveRecord::Migration
  def change
    change_table :shares do |t|
      t.date :upload_date, null: false
    end
  end
end
