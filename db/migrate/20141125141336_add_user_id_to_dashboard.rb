class AddUserIdToDashboard < ActiveRecord::Migration
  def change
    add_column :dashboards, :user_id, :string
    add_column :dashboards, :integer, :string
  end
end
