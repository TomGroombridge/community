class AddDefaultValueToSubsciptionAttribute < ActiveRecord::Migration
	def up
	  change_column :users, :subscription, :boolean, :default => false
	end

	def down
	  change_column :users, :subscription, :boolean, :default => true
	end
end
