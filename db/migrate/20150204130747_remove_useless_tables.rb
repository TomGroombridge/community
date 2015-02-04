class RemoveUselessTables < ActiveRecord::Migration
  def change
  	drop_table :brings
  	drop_table :need_to_wears  	
  end
end
