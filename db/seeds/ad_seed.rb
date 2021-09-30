require 'faker'
require 'pry'

puts "Creating ads"

3.times do
    Ad.create(
        name: Faker::Job.title,
        body: Faker::Lorem.word,
        employer_name: Faker::Name.name,
        employer_email: Faker::Internet.email,
        category: Faker::Job.field,
        time_period: Faker::Date.in_date_period(year: 2021, month: 10),
        )
        # binding.pry
end
