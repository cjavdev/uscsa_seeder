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

FactoryGirl.define do
  factory :seed do
    event_id 1
athlete_id 1
seeded 1
  end

end
