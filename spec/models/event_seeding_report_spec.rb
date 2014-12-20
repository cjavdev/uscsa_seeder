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
  pending "add some examples to (or delete) #{__FILE__}"
end
