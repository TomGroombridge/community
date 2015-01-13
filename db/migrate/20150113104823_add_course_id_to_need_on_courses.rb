class AddCourseIdToNeedOnCourses < ActiveRecord::Migration
  def change
  	add_column :need_on_courses, :course_id, :integer    
  end
end
