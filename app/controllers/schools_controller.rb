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

    if @school.save
      redirect_to @school
    else
      flash[:errors] = @school.errors.full_messages
      render :index
    end
  end

  private

  def school_params
    params.require(:school).permit(:name, :abbreviation)
  end
end
