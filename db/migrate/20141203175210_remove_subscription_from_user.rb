class RemoveSubscriptionFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :subscription
  end
end
