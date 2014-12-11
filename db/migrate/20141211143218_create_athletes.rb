class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.belongs_to :team, index: true
      t.string :bib_number, null: false
      t.boolean :eligible, default: true
      t.string :first_name
      t.string :last_name
      t.integer :sex, default: 0

      t.timestamps
    end
  end
end
