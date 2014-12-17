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
  
  belongs_to :athlete
  belongs_to :event
  
  validates :athlete, :event, :seeded, presence: true
  validates :athlete_id, uniqueness: { scope: :event_id }
  
  validate :valid_seed_num?
  
  def valid_seed_num?
    errors.add(:seeded, "Already a racer in that position") if self.event.seeded_positions(self.athlete.school.id).include?(self.seeded)
  end

end
