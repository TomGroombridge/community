class AddTimeToCourseDates < ActiveRecord::Migration
  def change
  	add_column :course_dates, :start_date, :date
	  add_column :course_dates, :start_time, :time
	  add_column :course_dates, :end_date, :date
	  add_column :course_dates, :end_time, :time
  end
end
