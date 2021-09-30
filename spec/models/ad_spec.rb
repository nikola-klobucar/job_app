require 'rails_helper'

RSpec.describe Ad, type: :model do
  it {is_expected.to have_db_column(:body).of_type(:text)}
  it {is_expected.to have_db_column(:time_period).of_type(:date)}

  context.describe "has many" do
    it {is_expected.to have_many(:jobs).dependent(:destroy)}
  end

  context.describe "validations" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.not_to validate_presence_of(:body)}
    it {is_expected.to validate_presence_of(:employer_name)}
    it {is_expected.to validate_presence_of(:employer_email)}
    it {is_expected.to validate_presence_of(:category)}
    it {is_expected.to validate_presence_of(:time_period)}
  end
end
