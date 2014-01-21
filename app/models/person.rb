class Person < ActiveRecord::Base
  validates :email,:departmentId,:gender,:name,:password,:projectId, :presence => true
  validates :password, :length => {maximum: 16,minimum: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },format: { with: VALID_EMAIL_REGEX }
end
