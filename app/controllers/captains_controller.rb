class CaptainsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @schools = School.all
    @athletes = Athlete.all
  end
end
