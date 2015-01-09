class RemoveQuantityAndEndTimeFromCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :end_time, :datetime
  	remove_column :courses, :quantity, :integer
  end
end
