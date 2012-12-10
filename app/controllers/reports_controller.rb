class ReportsController < ApplicationController
  def index
  end

  def show
    @report = params[:report]
  end
end
