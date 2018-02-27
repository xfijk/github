class User < ActiveRecord::Base
  before_save {self.email = email.downcase } # This sets all the emails entered into lower case
  validates :username, presence: true, 
            length: {minimum: 3, maximum: 25}, 
            uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
            uniqueness: {case_sensitive: false},
            length: {maximum: 105},
            format: {with: VALID_EMAIL_REGEX}
  validates :password, presence: true,
            length: {minimum: 8}
end