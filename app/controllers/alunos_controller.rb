class AlunosController < ApplicationController
	require_logged_user
  require_role_for_curso

  def index
  	@student = Students.all#.order("created_at desc")
  	@state = Country::STATES

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student }
    end
  end

  def show
    @student = Students.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  def new
    @student = Students.new
    @state = Country::STATES
    @student_code = "A#{Time.now.strftime('%y%m%d%H%M%S')}"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  def edit
    @student = Students.find(params[:id])
    @state = Country::STATES
  end

  def create
    @student = Students.new(params[:students])
    @state = Country::STATES

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @Students.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Students.find(params[:id])

    respond_to do |format|
      if @Students.update_attributes(params[:team])
        format.html { redirect_to students_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @Students.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Students.find(params[:id])
    @Students.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
  
end
