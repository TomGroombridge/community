class RemoveIntegerFromDashboard < ActiveRecord::Migration
  def change
    remove_column :dashboards, :integer, :string
    remove_column :dashboards, :user_id, :string
    add_column :dashboards, :user_id, :integer
  end
end
