class Answer < ActiveRecord::Base
  belongs_to :person ,foreign_key:"people_id"
  belongs_to :question
end
