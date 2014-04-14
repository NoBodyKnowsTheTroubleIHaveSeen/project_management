class Share < ActiveRecord::Base
  belongs_to :person,foreign_key: "people_id"
end
