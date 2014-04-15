class RemoveColumnOnPersonTasks < ActiveRecord::Migration
  def change
    change_table :person_tasks do |t|
      t.remove :is_done
      t.remove :finish_time
    end
  end
end
