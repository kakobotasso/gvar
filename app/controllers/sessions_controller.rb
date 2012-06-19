class SessionsController < ApplicationController
  
  def new
  end

  def create
    reset_session

    user = Authenticator.authenticate(params[:login], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to dashboard_path, :notice => "Logado com sucesso"
    else
      flash.now[:alert] = "Erro ao logar"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
