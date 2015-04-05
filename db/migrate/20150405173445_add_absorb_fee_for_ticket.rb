class AddAbsorbFeeForTicket < ActiveRecord::Migration
  def change
  	add_column :tickets, :absorb_fee, :boolean, :default => false
  end
end
