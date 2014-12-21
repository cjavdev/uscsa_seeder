# == Schema Information
#
# Table name: event_seeding_reports
#
#  id          :integer          not null, primary key
#  event_id    :integer          not null
#  report_data :json
#  created_at  :datetime
#  updated_at  :datetime
#

require 'rails_helper'

RSpec.describe EventSeedingReport, :type => :model do
  it '#report_data returns array of arrays based on raw data' do
    event = FactoryGirl.create(:event)
    allow(event).to receive(:athlete_ids_and_seeded).and_return([
      [1, 1],
      [5, 2],
      [211, 3],
      [19, 4],
      [10, 5],
      [9, 6],
      [100, 7],
    ])
    event_report = EventSeedingReport.create(event: event)
    expect(event_report.report_data).to include([
      [1, 1],
      [5, 2],
      [211, 3],
      [10, 5],
      [9, 6],
      [100, 7],
    ])
  end
end
