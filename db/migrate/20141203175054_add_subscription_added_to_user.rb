class AddSubscriptionAddedToUser < ActiveRecord::Migration
  def change
    add_column :users, :subscription_added, :boolean, :default => false
  end

  def down
	  change_column :users, :subscription, :boolean
	end
end
