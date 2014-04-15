class AddPlanIsDoneToSchedule < ActiveRecord::Migration
  def change
    change_table :schedules do |t|
      t.integer :plan_is_done
    end
  end
end
