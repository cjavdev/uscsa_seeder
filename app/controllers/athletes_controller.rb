class AthletesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_athletes

  def index
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  private

  def set_athletes
    if current_user.admin
      @athletes = Athlete.all
    else
      @athletes = current_user.team.athletes
    end
  end
end
