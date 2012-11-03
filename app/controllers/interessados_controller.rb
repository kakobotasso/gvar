# *-* encoding: UTF-8 *-*
class InteressadosController < ApplicationController
	require_logged_user
	require_role_for_curso

  def index
  	@interested = Interested.all#.order("created_at desc")
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interested }
    end
  end

  def show
    @interested = Interested.find(params[:id])
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interested }
    end
  end

  def new
    @interested = Interested.new
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interested }
    end
  end

  def edit
    @interested = Interested.find(params[:id])
    @situation = Category::Interested::SITUATION
  end

  def create
    @interested = Interested.new(params[:interested])
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      if @interested.save
        format.html { redirect_to interested_show_path @interested, notice: 'As informações do Interessado foram salvas com sucesso.' }
        format.json { render json: @interested, status: :created, location: @interested }
      else
        format.html { render action: "new" }
        format.json { render json: @interesteds.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @interested = Interested.find(params[:id])
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      if @interesteds.update_attributes(params[:interested])
        format.html { redirect_to interested_show_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interesteds.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interested = Interested.find(params[:id])
    @interesteds.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
  
end
