class SeedsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @seed = Seed.where(
      event_id: params[:event_id],
      athlete_id: params[:athlete_id]
    ).first_or_initialize

    maybe_destroy!
    
    if (current_user.can_manage_league? || self.event.seeding_closes_at < Date.current || current_user.can_seed_late) && @seed.update(seed_params)
      render json: @seed
    else
      render json: @seed.errors.full_messages, status: 422
    end
  end

  private

  def maybe_destroy!
    if params[:seeded] == -1
      @seed.destroy
      render json: @seed
      return
    end
  end

  def seed_params
    params.permit(:athlete_id, :seeded, :event_id)
  end
end
