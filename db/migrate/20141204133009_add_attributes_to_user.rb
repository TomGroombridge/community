class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :instagram, :string
    add_column :users, :google, :string
    add_column :users, :pinterest, :string
  end
end
