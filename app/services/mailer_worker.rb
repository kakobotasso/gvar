class MailerWorker
  include Qe::Worker
  include Qe::ActionMailer
  include Qe::Locale

  def mailer
    ChangePasswordMailer
  end
end
