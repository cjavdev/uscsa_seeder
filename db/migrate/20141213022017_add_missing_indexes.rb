class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :events, :meet_id
    add_index :users, [:invited_by_id, :invited_by_type]
    add_index :users, :athlete_id
  end
end
