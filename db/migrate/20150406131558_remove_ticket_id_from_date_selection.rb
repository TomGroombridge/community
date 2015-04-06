class RemoveTicketIdFromDateSelection < ActiveRecord::Migration
  def change
  	remove_column :date_selections, :ticket_id, :integer
  end
end
