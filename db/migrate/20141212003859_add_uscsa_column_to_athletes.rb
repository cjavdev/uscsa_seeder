class AddUscsaColumnToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :uscsa_num, :string
  end
end
