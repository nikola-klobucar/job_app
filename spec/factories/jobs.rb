FactoryBot.define do
  factory :job do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "foo@bar.com" }
    phone { "12345678" }
    address { "MyString" }
    qualification { "MyString" }
    ad {build(:ad)}
    applicant {build(:user)}
  end
end
