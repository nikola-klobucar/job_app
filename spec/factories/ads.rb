FactoryBot.define do
  factory :ad do
    name { "MyString" }
    body { "MyText" }
    employer_name { "MyString" }
    employer_email { "ads@bar.com" }
    category { "MyString" }
    time_period { "2021-09-30" }
    employer {create(:user)}
  end
end
