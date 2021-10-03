class EmployerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employer_mailer.job_created.subject
  #

  def job_created
    @job = params[:job]
    mail to: Job.last.ad.employer_email, subject: "Nova prijava za posao"
  end

end
