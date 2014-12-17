class SeedsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @seed = Seed.where(
      event_id: params[:event_id],
      athlete_id: params[:athlete_id]
    ).first_or_initialize

    if @seed.update(seed_params)
      render json: @seed
    else
      render json: @seed.errors.full_messages, status: 422
    end
  end

  private

  def seed_params
    params.permit(:athlete_id, :seeded, :event_id)
  end
end
