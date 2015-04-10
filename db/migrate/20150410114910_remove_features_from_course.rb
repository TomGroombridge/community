class RemoveFeaturesFromCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :price, :float
  end
end
