class ReportsController < ApplicationController
  def index
  end

  def show
    @report = Report.find(params[:id])
    send_data @report.to_csv
  end
end
