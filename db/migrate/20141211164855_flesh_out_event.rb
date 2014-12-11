class FleshOutEvent < ActiveRecord::Migration
  def change
    add_column :events, :start_at, :datetime
    add_column :events, :sex, :integer, default: 0
    add_column :events, :discipline, :integer, default: 0
  end
end
