class Ad < ApplicationRecord
    has_many :jobs, dependent: :destroy
    validates :name, :employer_name, :employer_email, :category, :time_period, presence: true
end
