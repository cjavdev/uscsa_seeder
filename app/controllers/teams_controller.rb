class TeamsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_school, only: [:create]

  def index
    @schools = School.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = @school.teams.new(team_params)

    unless @team.save
      flash[:errors] = @team.errors.full_messages
    end

    redirect_to @school
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to :back
  end

  private

  def team_params
    params.require(:team).permit(:discipline, :sex)
  end

  def set_school
    @school = School.find(params[:school_id])
  end
end
