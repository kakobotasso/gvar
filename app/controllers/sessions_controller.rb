# -*- encoding:utf-8 -*-
class SessionsController < ApplicationController
  layout 'site'

  def new
  end

  def create
    reset_session

    user = Authenticator.authenticate(params[:login], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to dashboard_path#, :notice => "Logado com sucesso"
    else
      flash.now[:notice] = "Usuário ou Senha incorretos, tente novamente."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  def lembrar_senha
  end

  def new_password
    user = User.find_by_email(params[:email])
    if user
      # Envia por email
      # ChangePasswordMailer.new_password_mail(user).deliver

      MailerWorker.enqueue({
        :mail          => :new_password_mail,
        :name          => user.name,
        :password_salt => user.password_salt,
        :email         => user.email
      })

      # Redireciona para o login
      redirect_to login_path, :notice => "Para concluir sua alteração de senha siga os procedimentos enviados para seu e-mail. (#{params['email']})"
    else
      redirect_to lembrar_senha_path, :notice => "E-mail não cadastrado. Por favor informar um e-mail válido"
    end
  end

  def create_password
    user = User.find_by_email_and_password_salt(params[:email], params[:ps])
    unless user
      redirect_to lembrar_senha_path, :notice => "Link para alterar senha expirou, informe novamente seu email."
    end
  end

  def create_new_password
    user = User.find_by_email(params[:email])
    if user
      user.password = params[:password]
      user.save
    end
    redirect_to login_path, :notice => "Senha alterada com sucesso!"
  end
end
