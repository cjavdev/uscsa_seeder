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

FactoryGirl.define do
  factory :event_seeding_report do
    event_id 1
    report_data ""
  end
end
