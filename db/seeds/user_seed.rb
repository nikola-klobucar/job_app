require 'faker'

puts "Creating users"

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: "12345",
        password_confirmation: "12345"
    )
end