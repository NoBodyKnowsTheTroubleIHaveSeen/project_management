class PersonTask < ActiveRecord::Base
  belongs_to :person,foreign_key: "people_id"
  belongs_to :task
  belongs_to :project
end