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

class EventSeedingReport < ActiveRecord::Base
  validates :event, presence: true
  belongs_to :event

  before_validation :compile_seed_data, on: :create

  def seeder_class
    event.seeder_class
  end

  def compile_seed_data
    self.report_data ||= seeder_class.new(seed_athlete_ids).generate_seeds.to_json
  end

  def seed_athlete_ids
    event.athlete_ids_and_seeded
  end

  def regenerate_seeds!
    self.report_data = Seeder.new(seed_athlete_ids).generate_seeds.to_json
    save!
  end

  def heats
    report_data.map do |heat|
      heat.map do |(athlete_id, seeded)|
        HeatAthlete.new(Athlete.find(athlete_id), seeded)
      end
    end
  end
end
