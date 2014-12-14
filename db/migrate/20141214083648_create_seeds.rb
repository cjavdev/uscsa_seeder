class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.integer :event_id,    null: false
      t.integer :athlete_id,  null: false
      t.integer :seeded,      null: false, default: -1

      t.timestamps
    end
  end
end
