class AddCourseIdToCourseDates < ActiveRecord::Migration
  def change
    add_column :course_dates, :course_id, :integer
  end
end
