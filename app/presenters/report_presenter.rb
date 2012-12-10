class ReportPresenter
  def initialize(list_reports)
    @reports = list_reports
  end

  def partial
    if @reports.size > 0
      {
        :partial => "reports/reports",
        :locals => { :reports => @reports }
      }
    else
      {
        :partial => "shared/no_results"
      }
    end
  end

end
