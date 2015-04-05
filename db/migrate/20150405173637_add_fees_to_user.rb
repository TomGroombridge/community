class AddFeesToUser < ActiveRecord::Migration
  def change
    add_column :users, :fees, :float
  end
end
