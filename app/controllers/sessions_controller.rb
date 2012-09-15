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
    # Mensagem erro: E-mail não cadastrado. Por favor informar um e-mail válido
    #flash[:notice] = "E-mail não cadastrado. Por favor informar um e-mail válido"

    # Mensagem sucesso: Sua nova senha foi enviada para o seu e-mail com sucesso
    #flash[:notice] = "Sua nova senha foi enviada para o seu e-mail com sucesso"
  end

end
