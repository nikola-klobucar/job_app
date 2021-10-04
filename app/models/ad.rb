class Ad < ApplicationRecord
    has_many :jobs, :dependent => :destroy
    validates :name, :employer_name, :employer_email, :category, :time_period, presence: true
    belongs_to :employer, class_name: 'User', foreign_key: 'user_id'

    def self.search(params)
        where("LOWER(name) LIKE :term OR LOWER(employer_name) LIKE :term OR LOWER(
            category) LIKE :term", 
            term: "%#{params}%")
    end
end
