class AddEntryIdToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :entry_id, :integer
  end
end
