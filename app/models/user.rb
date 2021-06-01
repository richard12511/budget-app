class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 60}
    validates :email, presence: true, length: { maximum: 255 }
    validates :email, presence: true, length: { maximum: 255 }, 
        format: { with: VALID_EMAIL_REGEX }, uniqueness: true,
        uniqueness: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }
end
