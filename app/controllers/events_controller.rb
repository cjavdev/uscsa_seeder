class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_meet

  def create
    @event = @meet.events.new(event_params)
    unless @event.save
      flash[:errors] = @event.errors.full_messages
    end
    redirect_to @meet
  end

  private

  def event_params
    params.require(:event).permit(:start_at, :discipline, :sex)
  end

  def set_meet
    @meet = Meet.find(params[:meet_id])
  end
end
