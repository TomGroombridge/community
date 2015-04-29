class AddEdfaultToPrice < ActiveRecord::Migration
  def up
	  change_column :payments, :price, :float, :default => 0.00
	end

	def down
	  change_column :payments, :price, :float
	end
end
