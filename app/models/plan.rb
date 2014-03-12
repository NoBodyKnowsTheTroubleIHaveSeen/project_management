class Plan < ActiveRecord::Base
  validates :people_id, :hard_level,:name, :description,:create_date, :presence => true
  validates :people_id, :hard_level, numericality: true
end