class MailerWorker
  include Qe::Worker

  def perform
    ChangePasswordMailer.public_send(options["mail"], options).deliver
  end
end
