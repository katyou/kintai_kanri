#users table
#name
#email
#status
#present

class User < ApplicationRecord
  before_save { self.email = self.email.downcase }
  has_many :work_times

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  has_secure_password

  enum status: {admin: 1, staff: 2, part_time: 3}

end
