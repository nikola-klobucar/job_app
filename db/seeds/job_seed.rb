require 'faker'

puts "Creating jobs"

ads = Ad.all

ads.each do |ad|
    5.times do
        Job.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.cell_phone_in_e164,
            address: Faker::Address.street_address,
            qualification: Faker::Job.education_level,
            ad: ad
        )
    end
end