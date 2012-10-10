class TurmasController < ApplicationController
  require_logged_user
  require_role_for_curso

  def index
    @team = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @team }
    end
  end

  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  def new
    @team = Team.new
    @course = Course.where(:active => true)
    @team_code = "T#{Time.now.strftime('%y%m%d%H%M%S')}"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(params[:team])

    respond_to do |format|
      if @team.save
        format.html { redirect_to courses_show_path(@team), notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  
  def cancel
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.update_attributes(:active => "false")
        format.html { redirect_to courses_path, notice: 'Turma cancelada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
