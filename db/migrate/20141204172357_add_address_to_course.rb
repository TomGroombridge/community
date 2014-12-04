class AddAddressToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :address, :text
  end
end
