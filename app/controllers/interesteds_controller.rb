# *-* encoding: UTF-8 *-*
class InterestedsController < ApplicationController
	require_logged_user
	require_role_for_curso

  def index
    @interesteds = Interested.all
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @interesteds }
    end
  end

  def show
    @interesteds = Interested.find(params[:id])
    @interesteds_contact = @interesteds.interested_contacts
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @interesteds }
    end
  end

  def new
    @interesteds = Interested.new
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @interesteds }
    end
  end

  def edit
    @interesteds = Interested.find(params[:id])
    @situation = Category::Interested::SITUATION
  end

  def history
    @interesteds = Interested.find(params[:id])
    @interesteds.interested_contacts.build
  end

  def save_history
    @interesteds = Interested.find(params[:id])

    respond_to do |format|
      if @interesteds.update_attributes(params[:interested])
        format.html { redirect_to interested_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interestedss.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @interesteds = Interested.new(params[:interested])
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      if @interesteds.save
        format.html { redirect_to interested_path(@interesteds), notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { render json: @interesteds, status: :created, location: @interesteds }
      else
        format.html { render action: "new" }
        format.json { render json: @interesteds.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @interesteds = Interested.find(params[:id])
    @situation = Category::Interested::SITUATION

    respond_to do |format|
      if @interesteds.update_attributes(params[:interested])
        format.html { redirect_to interested_path, notice: 'As informacoes foram atualizadas com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @interesteds.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interesteds = Interested.find(params[:id])
    @interestedss.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

end
