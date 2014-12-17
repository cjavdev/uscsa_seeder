class SeedsController < ApplicationController
  before_filter :authenticate_user!

  # def show
  #   @event = Event.find(params[:id])
  #   @teams = current_user
  #     .managed_teams
  #     .where(
  #       sex: Team.sexes[@event.sex],
  #       discipline: Team.disciplines[@event.discipline]
  #     )
  #
  #   render :show
  # end

  def update
    seed = Seed.find(params[:id])
    seed.seeded = params[:seeded]
    seed.save
    render nothing: true
  end

end
