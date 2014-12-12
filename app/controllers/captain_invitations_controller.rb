class CaptainInvitationsController < ApplicationController
  def create
    @user = User.invite!(invitation_params)
    redirect_to :back
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email, :athlete_id)
  end
end
