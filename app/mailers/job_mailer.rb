class JobMailer < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_mailer.published.subject
  #
  def published
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
