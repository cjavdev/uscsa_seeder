class RemoveSeedsFromDatabase < ActiveRecord::Migration
  def change
    drop_table :seeds
  end
end
