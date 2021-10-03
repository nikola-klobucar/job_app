# Preview all emails at http://localhost:3000/rails/mailers/employer
class EmployerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employer/job_created
  def job_created
    EmployerMailer.with(job: Job.last, applicant: User.last).job_created
  end

end
