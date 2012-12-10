# *-* encoding: UTF-8 *-*
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
        session[:object] = nil

        return redirect_to path_of_release(@release) if @service.nil?

        @service.save
        @service.update_attributes( { :release_id => @release.id } )
        return redirect_to @service

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

    @params = params[:payment] || params[:receipt]

    require "pry"; binding.pry
    respond_to do |format|
      if @release.update_attributes(@params)
        format.html { redirect_to path_of_release(@release), notice: "Lançamento: #{@release.code} foi atualizado com sucesso!" }
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
