FactoryBot.define do
  factory :ad do
    name { "MyString" }
    body { "MyText" }
    employer_name { "MyString" }
    employer_email { "MyString" }
    category { "MyString" }
    time_period { "2021-09-30" }
  end
end
