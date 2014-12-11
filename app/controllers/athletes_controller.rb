class AthletesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
end
