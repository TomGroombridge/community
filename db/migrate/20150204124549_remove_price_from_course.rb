class RemovePriceFromCourse < ActiveRecord::Migration
  def change
  	remove_column :courses, :price, :integer
  	add_column :courses, :price, :float
  end
end
