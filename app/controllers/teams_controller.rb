class TeamsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @schools = School.all
  end
  
  def show
    @team = Team.find(params[:id])
  end
end
