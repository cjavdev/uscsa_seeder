class AthletesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_athletes

  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  private

  def set_athletes
    if current_user.captain
    end
  end

end
