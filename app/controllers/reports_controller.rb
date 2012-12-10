class ReportsController < ApplicationController
  def index
  end

  def show
    @list_reports = ReportsFilter.filter(params[:report])
    @reports      = ReportPresenter.new(@list_reports)
  end
end
