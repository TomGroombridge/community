class RemoveAdminDefaultUsers < ActiveRecord::Migration
  def change
  	change_column_default(:users, :admin, nil)
  end
end
