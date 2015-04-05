class RemoveFees < ActiveRecord::Migration
  def change
  	remove_column :users, :fees, :float
  end
end
