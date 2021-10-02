require 'faker'

puts "Creating jobs"

ads = Ad.all
applicant = User.all[4..]

ads.each do |ad|
    5.times do
        Job.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            email: Faker::Internet.email,
            phone: Faker::PhoneNumber.cell_phone_in_e164,
            address: Faker::Address.street_address,
            qualification: ["NSS", "SSS", "VŠS", "VSS"].sample,
            ad: ad,
            applicant: applicant.sample
        )
    end
end