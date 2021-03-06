# -*- encoding:utf-8 -*-
class UsersController < ApplicationController
  require_logged_user
  require_role_for_admin :except => [:edit,:alterar_senha,:update_password]
  helper_method :roles

  # GET /users
  # GET /users.json
  def index
    @users = User.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Os dados do usuário foram salvos com sucesso!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Usuário foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # Alterar senha
  def alterar_senha
  end

  def update_password
    temp = Authenticator.authenticate(params[:login], params[:password])

    if(params[:new_password] != params[:new_password_confirmation])
      redirect_to alterar_senha_path, :notice => "Os campos 'Nova Senha' e 'Repetir Senha' devem ser iguais."
    elsif temp
      temp.password = params[:new_password]
      temp.save

      redirect_to dashboard_path, :notice => "Senha atualizada com sucesso"
    else
      redirect_to alterar_senha_path, :notice => "Erro ao atualizar senha."
    end
  end

  private
  def roles
    @roles ||= Role.scoped
  end
end
