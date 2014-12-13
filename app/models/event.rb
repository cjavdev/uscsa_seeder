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

class Event < ActiveRecord::Base
  validates :meet, :start_at, :sex, :discipline, presence: true
  after_create :increment_events_count

  enum sex: [:male, :female]
  enum discipline: [:free_style_ski, :alpine_ski, :snowboard]
  enum race_type: [:gs, :s, :bx, :sx, :ss, :rj]

  belongs_to :meet

  FULL_RACE_TYPES = {
    gs: 'Giant Slalom',
    s: 'Slalom',
    bx: 'Boarder Cross',
    sx: 'Skier Cross',
    ss: 'Slopestyle',
    rj: 'Rail Jam'
  }

  def self.full_race_types
    race_types.keys.map { |t| FULL_RACE_TYPES[t.to_sym] }
  end

  def full_race_type
    FULL_RACE_TYPES[race_type.to_sym]
  end

  def seeding_closes_at
    (start_at - 1.day).to_date.to_time + 17.hours
  end
  
  def increment_events_count
    self.meet.events_count += 1;
    self.meet.save!
  end
end
