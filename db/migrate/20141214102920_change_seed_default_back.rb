class ChangeSeedDefaultBack < ActiveRecord::Migration
  def change
    change_column :seeds, :seeded, :integer, default: -1
  end
end
