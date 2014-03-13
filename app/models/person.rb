class Person < ActiveRecord::Base
  validates :email,:department_id,:gender,:name,:password,:no, :presence => true
  validates :department_id,:no,:length => {maximum: 11},numericality: true
  validates :password, :length => {maximum: 16,minimum: 8}
  validates :gender,:length => {maximum: 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },format: { with: VALID_EMAIL_REGEX }
end
