class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_meet, except: [:destroy]

  def create
    @event = @meet.events.new(event_params)
    unless @event.save
      flash[:errors] = @event.errors.full_messages
    end
    redirect_to @meet
  end

  def destroy
    @event = Event.find(params[:id])
    meet = @event.meet
    @event.try(:destroy)
    redirect_to meets_path
  end

  private

  def event_params
    params.require(:event).permit(:start_at, :discipline, :sex)
  end

  def set_meet
    @meet = Meet.find(params[:meet_id])
  end
end
