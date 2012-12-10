class SchedulesController < ApplicationController
  require_logged_user
  require_role_for_servico

  layout false, :only => [:search]
  helper_method :services, :clients, :providers

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new
    @schedule.code = "S#{Time.now.strftime('%y%m%d%H%M%S')}"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.valid?
        session[:object] = @schedule

        format.html { redirect_to new_receipt_path }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to schedules_path, notice: 'Agendamento atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  def search
    @schedules          = SchedulesFilter.filter(params[:filtro])
    @schedule_presenter = SchedulePresenter.new(@schedules)
  end

  private
  def services
    @services  ||= Service.order(:name)
  end
  def clients
    @clients   ||= Client.order(:name)
  end
  def providers
    @providers ||= Provider.order(:name)
  end
end
