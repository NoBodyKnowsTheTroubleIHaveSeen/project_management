class ChangeHardLevel < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.integer :hard_level
    end
    change_table :person_tasks do |t|
      t.remove :hard_level
    end
  end
end
