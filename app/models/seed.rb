class Seed < ActiveRecord::Base
  
  belongs_to :athlete
  belongs_to :event
  
  validates :athlete_id, :event_id, :seeded, presence: true
end
