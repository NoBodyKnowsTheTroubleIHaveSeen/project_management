class AddAdviceToSchedules < ActiveRecord::Migration
  def change
    change_table :schedules do |t|
      t.integer :advice
    end
  end
end
