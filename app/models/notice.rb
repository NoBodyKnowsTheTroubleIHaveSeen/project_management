class Notice < ActiveRecord::Base
  belongs_to :person,foreign_key: "people_id"
  validates :title, :content, :date, :presence => true
end
