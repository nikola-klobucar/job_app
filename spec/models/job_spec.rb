require 'rails_helper'

RSpec.describe Job, type: :model do

  let(:job) {build(:job)}

  it "should be valid" do
    expect(job).to be_valid
  end

  context.describe "has foreign keys" do
    it { is_expected.to have_db_column(:ad_id).of_type(:integer) }
  end

  context.describe "is belonging to" do
    it { is_expected.to belong_to(:ad) }
  end

  context.describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:qualification) }
  end

  context.describe "email format" do

    it "has invalid email format" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.
    foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
      job.email = invalid_address
      expect(job).not_to be_valid
      end
    end
  end

  context.describe "phone characters" do
    it "should have between 8 and 14 characters" do
    expect(job).to validate_length_of(:phone).is_at_least(8).is_at_most(14)

    bad_phone_numbers = %w[1234567 123456789123456 asdfghjk a12345678]
    bad_phone_numbers.each do |bad_number|
      job.phone = bad_number
      expect(job).not_to be_valid
    end
    end

    it "should have only integer characters" do
      expect(job).to validate_numericality_of(:phone)
    end
  end
end
