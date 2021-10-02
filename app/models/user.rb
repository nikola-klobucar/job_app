class User < ApplicationRecord
    has_secure_password

    has_many :jobs, inverse_of: 'applicant'
    has_many :ads, inverse_of: 'employer'

    validates :first_name, :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
    validates :password, presence: true, length: 5..20
    validates :password_confirmation, presence: true, length: 5..20

end