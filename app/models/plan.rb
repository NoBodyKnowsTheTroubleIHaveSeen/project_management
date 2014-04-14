class Plan < ActiveRecord::Base
  belongs_to :person
  belongs_to :task
  validates :people_id, :hard_level,:name, :description,:create_date, :presence => true
  validates :people_id, :hard_level, numericality: true
end