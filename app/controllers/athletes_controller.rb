class AthletesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_athletes

  def index
    # TODO: limit this for captains
    @schools = School.all
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def create
    @athlete = @athletes.new(athlete_params)
    if @athlete.save
      redirect_to @athlete
    else
      flash[:errors] = @athlete.errors.full_messages
      render :index
    end
  end

  private

  def set_athletes
    if current_user.admin
      @athletes = Athlete.all
    else
      @athletes = current_user.team.athletes
    end
  end

  def athlete_params
    if current_user.admin
      params.require(:athlete).permit(:uscsa_number, :first_name, :last_name, :bib_number, :sex, :discipline, :team_id)
    else
      params.require(:athlete).permit(:uscsa_number, :first_name, :last_name, :bib_number, :sex, :discipline)
    end
  end
end
