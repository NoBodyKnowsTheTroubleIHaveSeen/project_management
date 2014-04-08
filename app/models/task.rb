class Task < ActiveRecord::Base
  validates :name, :project_id,:weight,:description,:start_date,:presence => true
  validates :project_id,:weight, numericality: true
end
