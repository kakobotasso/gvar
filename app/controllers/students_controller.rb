class StudentsController < ApplicationController
  require_logged_user
  require_role_for_curso

  helper_method :state, :sex, :decision, :phone_types

  def index
    @students = Student.all#.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
    end
  end

  def show
    @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  def new
    @student = Student.new
    @student.build_address
    @student.phones.build
    @student.phones.build # para ter 2 telefones na view

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  def edit
    @student = Student.find(params[:id])
    @student.build_address if @student.address.nil?
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path(@student), notice: 'As informacoes foram salvas com sucesso.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to student_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
  def state
    @state ||= Country::STATES
  end

  def sex
    @sex ||= Category::SEX
  end

  def decision
    @decision ||= Category::DECISION
  end

  def phone_types
    @phone_types ||= Phone::TYPES
  end
end
