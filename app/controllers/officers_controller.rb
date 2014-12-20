class OfficersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :ensure_admin!

  def index
    @officers = User.where(officer: true)
  end

  def destroy
    User.find(params[:id]).delete
    @officers = User.where(officer: true)
    render :index
  end

  private

  def ensure_admin!
    redirect_to athletes_url unless current_user.admin
  end
end
