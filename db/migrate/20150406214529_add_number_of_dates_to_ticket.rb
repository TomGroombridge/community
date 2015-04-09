class AddNumberOfDatesToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :number_of_dates, :integer, :default => 1
  end
end
