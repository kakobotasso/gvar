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
end
