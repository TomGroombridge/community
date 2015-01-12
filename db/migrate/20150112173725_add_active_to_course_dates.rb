class AddActiveToCourseDates < ActiveRecord::Migration
  def change
    add_column :course_dates, :active, :boolean, :default => false
  end
end
