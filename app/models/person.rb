class Person < ActiveRecord::Base
  has_many :answers,:dependent => :destroy
  has_many :questions,:dependent => :destroy
  has_many :notices,:dependent => :destroy
  has_many :person_projects,:dependent => :destroy
  has_many :person_tasks,:dependent => :destroy
  has_many :plans,:dependent => :destroy
  has_many :shares,:dependent => :destroy
  validates :email,:department_id,:gender,:name,:password,:no, :presence => true
  validates :department_id,:no,:length => {maximum: 11},numericality: true
  validates :gender,:length => {maximum: 10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },format: { with: VALID_EMAIL_REGEX }
end
