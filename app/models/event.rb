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
end
