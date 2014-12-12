class AthletesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_athletes
  before_filter :set_schools

  def index
    # TODO: limit this for captains
    @athlete = Athlete.new
  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def create
    @athlete = @athletes.new(athlete_params)
    if @athlete.save
      redirect_to @athlete
    else
      flash.now[:errors] = @athlete.errors.full_messages
      render :index
    end
  end

  def update
    @athlete = @athletes.find(params[:id])

    if @athlete.update(athlete_params)
      redirect_to @athlete
    else
      flash.now[:errors] = @athlete.errors.full_messages
      render :show
    end
  end

  private

  def set_schools
    if current_user.admin
      @schools = School.includes(teams: :athletes)
    else
      @schools = [current_user.team.school]
    end
  end

  def set_athletes
    @athletes = current_user.athletes
  end

  def athlete_params
    if current_user.admin
      params.require(:athlete).permit(:uscsa_number, :first_name, :last_name, :bib_number, :sex, :discipline, :team_id)
    else
      params.require(:athlete).permit(:uscsa_number, :first_name, :last_name, :bib_number, :sex, :discipline)
    end
  end
end
