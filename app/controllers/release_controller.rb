class ReleaseController < ApplicationController
  # before_filter :require_logged_release && :require_role_for_release
  
  # POST /Releases
  # POST /Releases.json
  def create
    @release = Release.new(params[:release])

    respond_to do |format|
      if @release.save
        format.html { redirect_to financeiro_index_path, notice: 'Lancamento cadastrado com sucesso.' }
        format.json { render json: @release, status: :created, location: @release }
      else
        format.html { redirect_to novo_pagamento_path }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Releases/1
  # PUT /Releases/1.json
  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
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

end