class Schedule < ActiveRecord::Base
  validates :people_id,:content,:description, :presence => true
end