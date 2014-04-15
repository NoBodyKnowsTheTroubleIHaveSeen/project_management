class AddIsDoneToPlans < ActiveRecord::Migration
  def change
    change_table :plans do |t|
      t.integer :is_done,default:0
    end
  end
end
