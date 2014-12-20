class CaptainsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_league_manager!

  def index
    @schools = School.includes(athletes: :user)
    @athletes = Athlete.all
  end

  private

  def require_league_manager!
    redirect_to athletes_path unless current_user.can_manage_league?
  end
end
