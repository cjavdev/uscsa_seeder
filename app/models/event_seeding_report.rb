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
  validates :event_id, uniqueness: true

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
    self.report_data = seeder_class.new(seed_athlete_ids).generate_seeds.to_json
    save!
  end

  def heats
    report_data.map do |heat|
      heat.map do |(athlete_id, seeded)|
        HeatAthlete.new(Athlete.find(athlete_id), seeded)
      end
    end
  end

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << [
        "heat_num",
        "athlete_num",
        "first_name",
        "last_name",
        "bib_number",
        "uscsa_number",
        "eligible",
        "sex",
        "athlete_id",
        "team_id",
      ]
      heats.each_with_index do |heat, heat_num|
        heat.each_with_index do |heat_athlete, athlete_num|
          csv << [
            heat_num + 1,
            athlete_num + 1,
            heat_athlete.first_name,
            heat_athlete.last_name,
            heat_athlete.bib_number,
            heat_athlete.eligible,
            heat_athlete.sex,
            heat_athlete.uscsa_number,
            heat_athlete.id,
            heat_athlete.team_id,
          ]
        end
      end
    end
  end
end
