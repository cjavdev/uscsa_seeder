class AthletesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_athletes
  before_filter :set_schools

  def index
    respond_to do |format|
      format.html { @athlete = Athlete.new }
      format.csv { send_data @athletes.to_csv }
    end
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
    unless @athlete.update(athlete_params)
      flash.now[:errors] = @athlete.errors.full_messages
    end
    redirect_to @athlete
  end

  private

  def set_schools
    @schools = current_user.schools
  end

  def set_athletes
    @athletes = current_user.athletes
  end

  def athlete_params
    if current_user.can_manage_league?
      params
        .require(:athlete)
        .permit(
          :uscsa_number,
          :first_name,
          :last_name,
          :bib_number,
          :sex,
          :discipline,
          :team_id,
          :eligible
        )
    else
      params
        .require(:athlete)
        .permit(
          :uscsa_number,
          :first_name,
          :last_name,
          :bib_number,
          :sex,
          :discipline,
          :eligible
        )
    end
  end
end
