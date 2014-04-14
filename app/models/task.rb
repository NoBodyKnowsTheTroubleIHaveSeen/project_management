class Task < ActiveRecord::Base
  has_many :person_tasks ,:dependent => :destroy
  has_one :plan,:dependent => :destroy
  validates :name, :project_id,:weight,:description,:start_date,:presence => true
  validates :project_id,:weight, numericality: true
end
