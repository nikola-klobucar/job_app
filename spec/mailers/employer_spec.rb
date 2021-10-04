require "rails_helper"

RSpec.describe EmployerMailer, type: :mailer do
  describe "job_created" do
    let(:mail) { EmployerMailer.job_created }
    it "renders the headers" do
      expect(mail.subject).to eq("Nova prijava za posao")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["donotreply@jobapp.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
