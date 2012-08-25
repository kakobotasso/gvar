class ReleaseController < ApplicationController
  before_filter :require_logged_Release && :require_role_for_Release
  helper_method :roles

  # GET /Releases
  # GET /Releases.json
  def index
    @releases = Release.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @releases }
    end
  end

  # GET /Releases/1
  # GET /Releases/1.json
  def show
    @release = Release.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @release }
    end
  end

  # GET /Releases/new
  # GET /Releases/new.json
  def new
    @release = Release.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @release }
    end
  end

  # GET /Releases/1/edit
  def edit
    @release = Release.find(params[:id])
  end

  # POST /Releases
  # POST /Releases.json
  def create
    @release = Release.new(params[:Release])

    respond_to do |format|
      if @release.save
        format.html { redirect_to @release, notice: 'Release was successfully created.' }
        format.json { render json: @release, status: :created, location: @release }
      else
        format.html { render action: "new" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Releases/1
  # PUT /Releases/1.json
  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:Release])
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Releases/1
  # DELETE /Releases/1.json
  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    respond_to do |format|
      format.html { redirect_to Releases_url }
      format.json { head :no_content }
    end
  end

  private
  def roles
    @roles ||= Role.scoped
  end
end
