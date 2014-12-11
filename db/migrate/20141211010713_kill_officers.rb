class KillOfficers < ActiveRecord::Migration
  def change
    drop_table :officers
  end
end
