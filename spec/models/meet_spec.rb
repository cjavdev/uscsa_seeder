# == Schema Information
#
# Table name: meets
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  events_count :integer          default(0)
#

require 'rails_helper'

RSpec.describe Meet, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
