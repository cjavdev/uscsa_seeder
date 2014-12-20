class OfficersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @officers = User.where(officer: true)
  end
  
  def destroy
    User.find(params[:id]).delete
    @officers = User.where(officer: true)
    render :index
  end
end
