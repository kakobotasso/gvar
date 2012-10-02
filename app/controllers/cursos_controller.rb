class CursosController < ApplicationController
  require_logged_user
  require_role_for_curso
  
  def index
  	@curso = Course.all
  end

  def new
  	@course = Course.new
  	@course_category = Category::Courses::OPTIONS
  	@course_code = "C#{Time.now.strftime('%y%m%d%H%M%S')}"
  end

  def create
  	@course = Course.new(params[:course])

  	if @course.save
  		redirect_to cursos_show_path(@course), :notice => "As informacoes foram salvas com sucesso"
  	else
  		render :new
  	end
  end

  def show
  	@course = Course.find(params[:id])
  end

  def edit
  	@course = Course.find(params[:id])
  end

  def update
  	@course = Course.find(params[:id])
  	
    if @course.update_attributes(params[:course])
  		redirect_to cursos_detalhe(@course), :notice => 'As informacoes foram atualizadas com sucesso!'
  	else
  		render :update
  	end

  end

end
