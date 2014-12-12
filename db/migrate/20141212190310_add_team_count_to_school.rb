class AddTeamCountToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :teams_count, :integer, default: 0
  end
end
