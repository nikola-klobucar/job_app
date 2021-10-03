# Preview all emails at http://localhost:3000/rails/mailers/applicant
class ApplicantPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/applicant/job_created
  def job_created
    ApplicantMailer.with(job: Job.last, applicant: User.last).job_created
  end

end
