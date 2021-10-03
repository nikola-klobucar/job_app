require 'rails_helper'

RSpec.describe User, type: :model do
  context.describe "has many associations" do
    it { is_expected.to have_many(:ads) }
  end

  context.describe "validations" do
    let(:user) { build(:user) }

    it "should have a unique, case-insensitive email" do
      expect(user).to validate_uniqueness_of(:email).case_insensitive
    end

    it "should have password length of at least 6" do
      expect(user).to validate_length_of(:password).is_at_least(5).is_at_most(20)
    end

    it "is expected to be valid" do
      expect(user).to be_valid
    end

    it "should have non-blank email" do
      expect(user.email).not_to be_blank
    end

    it "first and last name should be present" do
      expect(user).to validate_presence_of(:first_name)
      expect(user).to validate_presence_of(:last_name)
    end

    context.describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
        
        addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid
        end
      end
    end
  
    context.describe "when email format is invalid" do
      it "should be invalid" do
        invalid_address = "user_at_foo.org"
      
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end

  context.describe "dependency with jobs and ads" do
    it "has a depencency with ads" do
      user = User.create(
        first_name: "foo", 
        last_name: "bar", 
        email: "foo@bar.com", 
        password: "password", 
        password_confirmation: "password"
      )

      ad = Ad.create(
        name: "Lorem",
        employer_name: "Nikola",
        employer_email: "foo@bar.com",
        category: "IT",
        time_period: "2021-09-30",
        employer: user
      )

      user.delete
      expect(ad).to be_nil
    end
  end
end
