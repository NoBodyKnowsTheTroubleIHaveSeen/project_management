class AddPlanIsDonedToSchedule < ActiveRecord::Migration
  def change
    change_table :schedules do |t|
      t.integer :plan_is_doned
    end
  end
end
