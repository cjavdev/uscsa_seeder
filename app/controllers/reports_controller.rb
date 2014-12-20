class ReportsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @report = Report.find(params[:id])
    send_data @report.to_csv
  end
end
