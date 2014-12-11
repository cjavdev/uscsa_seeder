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
#

require 'rails_helper'

RSpec.describe Event, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
