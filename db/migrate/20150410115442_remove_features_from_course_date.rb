class RemoveFeaturesFromCourseDate < ActiveRecord::Migration
  def change
  	remove_column :course_dates, :quantity, :integer
  end
end
