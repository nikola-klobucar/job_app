FactoryBot.define do
  factory :job do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "bar@foo.com" }
    phone { "12345678" }
    address { "MyString" }
    qualification { "MyString" }
    applicant {create(:user)}
    ad {create(:ad)}
  end
end
