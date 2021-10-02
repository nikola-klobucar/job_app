require 'faker'

puts "Creating ads"

employers = User.all[0..3]

employers.each do |employer|
    3.times do
        ad = Ad.create(
            name: Faker::Job.title,
            body: Faker::Lorem.word,
            employer_name: "#{employer.first_name} #{employer.last_name}",
            employer_email: employer.email,
            category: ["IT", "HR", "Edukacija", "Prirodne znanosti"].sample,
            time_period: Faker::Date.in_date_period(year: 2021, month: [9, 10].sample),
            employer: employer
            )
    end
end
