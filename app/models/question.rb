class Question < ActiveRecord::Base
  validates :title,:content,:people_id,:create_date,:presence => true
  validates :people_id,:numericality => true
end