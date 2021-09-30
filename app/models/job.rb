class Job < ApplicationRecord
    belongs_to :ad

    validates :first_name, :last_name, :address, :qualification, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :phone, presence: true, length: 8..14, numericality: { only_integer: true}
end
