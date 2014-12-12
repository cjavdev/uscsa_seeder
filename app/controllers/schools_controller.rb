class SchoolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @schools = School.all
  end

  def show
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(school_params)

    unless @school.save
      flash[:errors] = @school.errors.full_messages
    end

    redirect_to schools_path
  end

  def destroy
    @school = School.find(params[:id])
    @school.try(:destroy)
    redirect_to schools_path
  end

  private

  def school_params
    params.require(:school).permit(:name, :abbreviation)
  end
end
