class AddPrivilegeToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :priviliege,null:false
    end
  end
end
