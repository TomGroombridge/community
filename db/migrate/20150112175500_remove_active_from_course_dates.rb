class RemoveActiveFromCourseDates < ActiveRecord::Migration
  def change
  	remove_column :course_dates, :active, :boolean
  end
end
