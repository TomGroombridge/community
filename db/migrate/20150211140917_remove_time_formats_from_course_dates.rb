class RemoveTimeFormatsFromCourseDates < ActiveRecord::Migration
  def change
  	remove_column :course_dates, :start_date, :datetime
  	remove_column :course_dates, :end_date, :datetime 	
  end

 
end
