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

  def compile_seed_data
    self.report_data ||= Seeder.new(seed_athlete_ids).generate_seeds.to_json
  end

  def seed_athlete_ids
    event.seeds.pluck(:athlete_id, :seeded)
  end

  def regenerate_seeds!
    self.report_data = Seeder.new(seed_athlete_ids).generate_seeds.to_json
    save!
  end
end
