# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  meet_id    :integer
#  start_at   :datetime
#  sex        :integer          default(0)
#  discipline :integer          default(0)
#  race_type  :integer          default(0)
#

require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe '#seeding_closes_at' do
    it 'returns the correct date time for close' do
      event = FactoryGirl.create(:event, start_at: Time.new(2000, 01, 01, 13, 30, 0))

      expect(event.seeding_closes_at).to eq(Time.new(1999, 12, 31, 17, 0, 0))
    end
  end
end
