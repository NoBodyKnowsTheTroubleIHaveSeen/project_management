class AddPrivilegeToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :priviliege,default:0,null:false
    end
  end
end
