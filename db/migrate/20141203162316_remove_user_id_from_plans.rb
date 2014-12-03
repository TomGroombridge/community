class RemoveUserIdFromPlans < ActiveRecord::Migration
  def change
  	remove_column :plans, :user_id, :integer
  end
end
