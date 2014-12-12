class ChangeUscsaNum < ActiveRecord::Migration
  def change
    rename_column :athletes, :uscsa_num, :uscsa_number
  end
end
