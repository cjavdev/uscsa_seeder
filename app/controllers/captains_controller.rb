class CaptainsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_league_manager!

  def index
    @schools = School.includes(athletes: :user)
    @athletes = Athlete.all
  end
  
  def update
    # Used for allowing captains to seed after registration closes
    
    @captain = Athlete.find(params[:id])
    if @captain.user.update(captain_params)
      render json: :success
    else
      render json: :error, status: 422
    end
  end

  private

  def require_league_manager!
    redirect_to athletes_path unless current_user.can_manage_league?
  end
  
  def captain_params
    if current_user.can_manage_league?
      params.require(:captain).permit(:can_seed_late)
    end
  end
  
end
