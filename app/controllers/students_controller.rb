class StudentsController < ApplicationController
	require_logged_user
  require_role_for_curso

  def index
  	@students = Student.all#.order("created_at desc")
  	@state = Country::STATES

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  def show
    @students = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @students }
    end
  end

  def new
    @students = Student.new
    @state = Country::STATES
    @students_code = "A#{Time.now.strftime('%y%m%d%H%M%S')}"
    @sexo = Student::SEXO
    @relacao = Student::RELACAO

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @students }
    end
  end

  def edit
    @students = Student.find(params[:id])
    @state = Country::STATES
    @sexo = Student::SEXO
    @relacao = Student::RELACAO
  end

  def create
    @students = Student.new(params[:student])
    @state = Country::STATES
    @sexo = Student::SEXO
    @relacao = Student::RELACAO

    respond_to do |format|
      if @students.save
        format.html { redirect_to student_path(@students), notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @students, status: :created, location: @students }
      else
        format.html { render action: "new" }
        format.json { render json: @students.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @students = Student.find(params[:id])
    @state = Country::STATES
    @sexo = Student::SEXO
    @relacao = Student::RELACAO

    respond_to do |format|
      if @students.update_attributes(params[:student])
        format.html { redirect_to student_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @students.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @students = Student.find(params[:id])
    @studentss.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
  
end
