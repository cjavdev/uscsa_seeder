class AddMeetToEvent < ActiveRecord::Migration
  def change
    add_column :events, :meet_id, :integer
  end
end
