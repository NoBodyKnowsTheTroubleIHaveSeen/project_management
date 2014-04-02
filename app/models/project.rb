class Project < ActiveRecord::Base
  validates :manager_id, :start_date, :name, :presence => true
  validates :manager_id, numericality: true
end
