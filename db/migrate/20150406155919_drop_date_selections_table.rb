class DropDateSelectionsTable < ActiveRecord::Migration
  def change
  	drop_table :date_selections
  end
end
