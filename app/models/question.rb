class Question < ActiveRecord::Base
  has_many :answers,:dependent => :destroy
  belongs_to :person,foreign_key: "people_id"
  validates :title,:content,:people_id,:create_date,:presence => true
  validates :people_id,:numericality => true
end