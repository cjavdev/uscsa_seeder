class SchoolsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @schools = School.all
    @school = School.new
  end

  def show
    @school = School.find(params[:id])
  end

  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to schools_path
    else
      @schools = School.all
      flash.now[:errors] = @school.errors.full_messages
      render :index
    end
  end

  def update
    @school = School.find(params[:id])

    if @school.update(school_params)
      redirect_to @school
    else
      flash.now[:errors] = @school.errors.full_messages
      render :show
    end
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
