class AllowCaptainsToSeedLate < ActiveRecord::Migration
  def change
    add_column :users, :can_seed_late, :boolean, default: false
  end
end
