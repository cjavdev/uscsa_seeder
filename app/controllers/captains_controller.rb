class CaptainsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @schools = School.includes(athletes: :user)
    @athletes = Athlete.all
  end
end
