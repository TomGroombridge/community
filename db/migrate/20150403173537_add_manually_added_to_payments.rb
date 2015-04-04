class AddManuallyAddedToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :manually_added, :boolean, :default => false
  end
end
