class Project < ActiveRecord::Base
  has_many :person_projects,:dependent => :destroy
  validates :manager_id, :start_date, :name, :presence => true
  validates :manager_id, numericality: true
end
