class RemoveTypeFromTicket < ActiveRecord::Migration
  def change
    remove_column :tickets, :type, :string
  end
end
