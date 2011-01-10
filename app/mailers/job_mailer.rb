class JobMailer < ActionMailer::Base
  default :from => "mario@jobs.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_mailer.published.subject
  #
  def published job
    @job = job

    mail :to => @job.email, :subject => "Empleos TI: #{@job.title}"
  end
end
