class ChangeSeedDefaultNum < ActiveRecord::Migration
  def change
    change_column :seeds, :seeded, :integer, default: 0
  end
end
