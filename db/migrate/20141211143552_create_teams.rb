class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.belongs_to :school, index: true
      t.integer :sex, default: 0
      t.integer :discipline, default: 0

      t.timestamps
    end
  end
end
