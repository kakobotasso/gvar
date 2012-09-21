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
    redirect_to root_path
  end

  def lembrar_senha
  end

  def new_password
    user = User.find_by_email(params[:email])
    if user
      # Troca a senha
      letras        = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten; # Todas as letras maiusculas e minusculas
      nova_senha    = (0...4).map{ letras[rand(letras.length)] }.join; # Escolhe 6 letras
      nova_senha    = "#{nova_senha}#{rand(10)}#{rand(10)}"            # Acrescenta 2 numeros
      user.password = nova_senha                                       # Define a nova senha do usuario
      user.save

      # Envia por email
      ChangePasswordMailer.new_password_mail(user,nova_senha).deliver

      # Redireciona para o login
      redirect_to login_path, :notice => "Sua nova senha foi enviada para o seu e-mail com sucesso"
    else
      redirect_to lembrar_senha_path, :notice => "E-mail não cadastrado. Por favor informar um e-mail válido"
    end
  end

end
