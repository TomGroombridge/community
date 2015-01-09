class RemoveDatesFromCourses < ActiveRecord::Migration
  def change
  	remove_column :courses, :Date, :datetime
  end
end
