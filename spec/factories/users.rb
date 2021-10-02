FactoryBot.define do
  factory :user do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "foo@bar.com" }
    password { "123456" }
    password_confirmation {"123456"}
  end
end
