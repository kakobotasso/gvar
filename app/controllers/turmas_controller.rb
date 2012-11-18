class TurmasController < ApplicationController
  require_logged_user
  require_role_for_curso

  layout false, :only => [:save_activity]

  def index
    @team = Team.where("status != 2").order("created_at desc")
    @courses = Course.where(:active => true)
    @season = Category::Seasons::OPTIONS
    @status = Status::TEAMS

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
    @courses = Course.where(:active => true)
    @team_code = "T#{Time.now.strftime('%y%m%d%H%M%S')}"
    @season = Category::Seasons::OPTIONS
    @status = Status::TEAMS

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  def edit
    @team = Team.find(params[:id])
    @courses = Course.where(:active => true)
    @season = Category::Seasons::OPTIONS
    @status = Status::TEAMS
  end

  def create
    @team = Team.new(params[:team])
    @courses = Course.where(:active => true)
    @season = Category::Seasons::OPTIONS
    @status = Status::TEAMS

    respond_to do |format|
      if @team.save
        format.html { redirect_to teams_show_path(@team), notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team = Team.find(params[:id])
    @courses = Course.where(:active => true)
    @season = Category::Seasons::OPTIONS
    @status = Status::TEAMS

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
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
  
  # CANCELA A TURMA
  def cancel
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.update_attributes(:status => "2")
        format.html { redirect_to teams_path, notice: 'Turma cancelada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end


  # CONCLUI A TURMA
  def conclude
    @team = Team.find(params[:id])
    respond_to do |format|
      if @team.update_attributes(:status => "1")
        format.html { redirect_to teams_path, notice: 'Turma cancelada com sucesso' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PLANEJAMENTO DA TURMA
  def planning
    @team = Team.find(params[:id])
    @meetings = @team.meetings
  end

  def save_meeting
    @meeting = Meeting.new(params[:meeting])
    @meeting.save
    redirect_to teams_planning_path @meeting.team_id
  end
  
  def save_activity
    @meeting = Meeting.find(params[:atividade][:meeting_id])
    #@meeting.activities_attributes = params[:atividade]
    #@meeting = Meeting.find(10)
    @meeting.activities_attributes = { [0] => params[:atividade] }
    @meeting.save
    @meeting = Meeting.find(params[:atividade][:meeting_id]).activities.order("created_at DESC")
  end

end
