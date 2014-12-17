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

class Seed < ActiveRecord::Base
  validates :athlete, :event, :seeded, presence: true
  validates :athlete_id, uniqueness: { scope: :event_id }

  belongs_to :athlete
  belongs_to :event
end
