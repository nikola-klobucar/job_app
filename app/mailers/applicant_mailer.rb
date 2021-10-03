class ApplicantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.applicant_mailer.job_created.subject
  #
  def job_created
    @job = params[:job]
    mail to: Job.last.applicant.email, subject: "Vaša prijava za posao"
  end
end
