class RemoveCourseProvierTable < ActiveRecord::Migration
  def change
    drop_table :course_providers
  end
end
