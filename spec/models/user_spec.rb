# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default("")
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  officer                :boolean          default(FALSE)
#  captain                :boolean          default(FALSE)
#  admin                  :boolean          default(FALSE)
#  athlete_id             :integer
#  invitation_token       :string(255)
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string(255)
#  invitations_count      :integer          default(0)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'can not be both officer and captain'

  describe '#managed_teams' do
    context 'when the user is an admin' do
      it 'returns all the teams' do
        user = FactoryGirl.create(:user, admin: true)
        FactoryGirl.create(:team)
        FactoryGirl.create(:team)
        expect(user.managed_teams.map(&:id)).to eq(Team.all.map(&:id))
      end
    end

    context 'when the user is a captain' do
      it 'returns just the teams from the same school as the captain' do
        unr = FactoryGirl.create(:school)
        unlv = FactoryGirl.create(:school)
        team1 = FactoryGirl.create(:team, school: unr)
        team2 = FactoryGirl.create(:team, school: unr)
        FactoryGirl.create(:team, school: unlv)

        athlete = FactoryGirl.create(:athlete, team: team1)
        user = FactoryGirl.create(:user, captain: true, athlete: athlete)

        expect(user.managed_teams.map(&:id)).to eq([team1.id, team2.id])
      end
    end
  end
end
