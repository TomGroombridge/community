class ChangeUserFeesToBigDecimal < ActiveRecord::Migration
	def up
	  change_column :users, :fees, :decimal, :default => 0.00
	end

	def down
	  change_column :users, :fees, :float
	end
end
