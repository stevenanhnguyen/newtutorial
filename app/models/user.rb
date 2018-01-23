class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.{1}[a-z]+\z/i

  validates :name, presence: true,
    length: {maximum: Settings.users.name.length.maximum}
  validates :email, presence: true,
    length: {maximum: Settings.users.email.length.maximum},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.users.password.length.minimum}
  validates :gender, inclusion: {in: sexes.values}

  has_secure_password

  before_save :downcase_email
end
