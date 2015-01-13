class RemoveAddressFromCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :address, :text
  end
end
