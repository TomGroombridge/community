class AddFeesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fees, :float, :default => 0.00
  end
end
