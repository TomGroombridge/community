class RemoveDatesFromCourseDates < ActiveRecord::Migration
  def change
  	add_column :course_dates, :start_date, :datetime
  	add_column :course_dates, :end_date, :datetime
  	remove_column :course_dates, :dates, :datetime
  end
end
