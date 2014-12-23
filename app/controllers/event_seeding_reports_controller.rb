class EventSeedingReportsController < ApplicationController
  before_action :authenticate_user!

  def show
    @report = EventSeedingReport.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.csv { send_data @report.to_csv }
    end
  end

  def create
    @report = EventSeedingReport.new(event_seeding_report_params)
    if @report.save
      redirect_to @report
    else
      flash[:errors] = @report.errors.full_messages
      redirect_to @report.event
    end
  end

  def update
    @report = EventSeedingReport.find(params[:id])
    @report.regenerate_seeds!
    redirect_to :back
  end

  private

  def event_seeding_report_params
    params.permit(:event_id)
  end
end
