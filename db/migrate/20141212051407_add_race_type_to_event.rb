class AddRaceTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :race_type, :integer, default: 0
  end
end
