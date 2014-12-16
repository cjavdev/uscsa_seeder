# == Schema Information
#
# Table name: seeds
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  athlete_id :integer          not null
#  seeded     :integer          default(-1), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Seed, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
