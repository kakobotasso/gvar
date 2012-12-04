class ReleaseController < ApplicationController
  # before_filter :require_logged_release && :require_role_for_release

  # POST /Releases
  # POST /Releases.json
  def create
    @release = Release.new(params[:release])
    @release.select_type

    respond_to do |format|
      if @release.save
        @service = session[:object]
        @service.save
        @service.update_attributes( { :release_id => @release.id } )

        format.html { redirect_to @service }
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

  private
  def path_of_release(object)
    eval("#{object.type.to_s.downcase.pluralize}_path")
  end

end
