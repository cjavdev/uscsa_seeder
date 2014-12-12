class AddEventsCountToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :events_count, :integer, default: 0
  end
end
