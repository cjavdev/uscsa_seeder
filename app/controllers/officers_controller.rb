class OfficersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @officers = User.where(captain: false)
  end
end
