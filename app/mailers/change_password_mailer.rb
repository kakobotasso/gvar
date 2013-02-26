class ChangePasswordMailer < ActionMailer::Base
  default from: "piruk7@gmail.com"

  def new_password_mail(options)
    @usuario = options["name"]
    @senha   = options["password"]
    @url     = root_url
    @subject = options["subject"] || "Nova senha para acesso ao GVAR"

    mail(:to => options["email"], :subject => @subject)
  end
end
