class AddCourseIdToAddress < ActiveRecord::Migration
  def change
  	add_column :course_addresses, :course_id, :integer
  end
end
