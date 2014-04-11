class Notice < ActiveRecord::Base
  validates :title, :content, :date, :presence => true
end
