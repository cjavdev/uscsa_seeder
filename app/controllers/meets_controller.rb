class MeetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @meets = Meet.all
  end

  def show
    @meet = Meet.find(params[:id])
  end

  def create
    @meet = Meet.new(meet_params)

    if @meet.save
      redirect_to meets_path
    else
      flash[:errors] = @meet.errors.full_messages
      render :index
    end
  end

  def destroy
    @meet = Meet.find(params[:id])
    @meet.try(:destroy)
    redirect_to meets_url
  end

  private

  def meet_params
    params.require(:meet).permit(:name)
  end
end
