class AddAthleteIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :athlete_id, :integer
  end
end
