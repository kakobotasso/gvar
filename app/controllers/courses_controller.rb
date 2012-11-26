class CoursesController < ApplicationController
  require_logged_user
  require_role_for_curso

  def index
    @course = Course.where(:active => true).order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  def new
    @course = Course.new
    @course_category = Category::Courses::OPTIONS
    @course.code = "C#{Time.now.strftime('%y%m%d%H%M%S')}"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  def edit
    @course = Course.find(params[:id])
    @course_category = Category::Courses::OPTIONS
  end

  def create
    @course = Course.new(params[:course])
    @course_category = Category::Courses::OPTIONS

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_path(@course), notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
    @course_category = Category::Courses::OPTIONS

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def cancel
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update_attributes(:active => "false")
        format.html { redirect_to courses_path, notice: 'Curso cancelado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

end