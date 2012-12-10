class RegistrationsController < ApplicationController
  require_logged_user
  require_role_for_curso

  layout false, :only => [:search_students]

  def index
  	@registration = Registration.all#.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registration }
    end
  end

  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @registration }
    end
  end

  def new
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.valid?
        session[:object] = @registration

        format.html { redirect_to registration_path }
        format.json { render json: @registration, status: :created, location: @registration }
      else
        format.html { render action: "new" }
        format.json { render json: @registrations.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:students])
        format.html { redirect_to registration_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registrations.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registrations.destroy

    respond_to do |format|
      format.html { redirect_to registration_url }
      format.json { head :no_content }
    end
  end

  def search_students
    @alunos = Student.where("name LIKE :search or CPF LIKE :search", :search => "%#{params[:filtro][:name_or_cpf]}%" )
  end

  def choose_team
    @inscricao = Registration.new
    @inscricao.student = Student.find(params[:id])
  end
end
