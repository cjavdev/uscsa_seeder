class CreateEventSeedingReports < ActiveRecord::Migration
  def change
    create_table :event_seeding_reports do |t|
      t.integer :event_id, null: false
      t.json :report_data

      t.timestamps
    end
  end
end
