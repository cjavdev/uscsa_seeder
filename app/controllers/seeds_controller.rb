class SeedsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    if current_user.captain?
      @team = current_user.athlete.school.teams.where({ discipline: event.discipline, sex: event.sex })
    end
  end
end
