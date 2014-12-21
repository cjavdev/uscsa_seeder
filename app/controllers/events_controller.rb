class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_meet, except: [:destroy, :show]

  def show
    @event = Event.find(params[:id])
    @teams = current_user
      .managed_teams
      .where(
        sex: Team.sexes[@event.sex],
        discipline: Team.disciplines[@event.discipline]
      )
    render :show
  end

  def create
    @event = @meet.events.new(event_params)
    unless @event.save
      flash[:errors] = @event.errors.full_messages
    end
    redirect_to @meet
  end

  def destroy
    @event = Event.find(params[:id])
    @event.try(:destroy)
    redirect_to meets_path
  end

  private

  def event_params
    params.require(:event).permit(:start_at, :discipline, :sex, :race_type)
  end

  def set_meet
    @meet = Meet.find(params[:meet_id])
  end
end
